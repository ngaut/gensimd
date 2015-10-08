package main

import (
	"flag"
	"fmt"
	"io/ioutil"
	"log"
	"os"
	"strings"

	"github.com/bjwbell/gensimd/codegen"
	"github.com/bjwbell/gensimd/simd"

	"go/build"

	"golang.org/x/tools/go/loader"
	"golang.org/x/tools/go/ssa"
	"golang.org/x/tools/go/ssa/ssautil"
	"golang.org/x/tools/go/types"
)

func filePath(pathName string) string {
	split := strings.Split(pathName, "/")
	dir := ""
	if len(split) == 1 {
		dir = "."
	} else if len(split) == 2 {
		dir = split[0] + "/"
	} else {
		dir = strings.Join(split[0:len(split)-2], "/")
	}
	return dir
}

func fileName(pathName string) string {
	split := strings.Split(pathName, "/")
	name := ""
	if len(split) == 0 {
		name = ""
	} else {
		name = split[len(split)-1]
	}
	return name
}

func main() {
	var ssaDump = flag.Bool("ssa", false, "dump ssa representation")
	var outputFile = flag.String("o", "", "write Go Assembly to file")
	flag.Parse()
	args := flag.Args()
	file := os.ExpandEnv("$GOFILE")
	funcName := ""
	if len(args) == 1 {
		funcName = args[0]

	} else if len(args) == 2 {
		file = args[0]
		funcName = args[1]
	}
	f, err := simd.ParseFile(file)
	if err != nil {
		msg := "Error parsing file \"%v\", error msg \"%v\""
		log.Fatalf(msg, file, err)
	}

	filePkgName := f.Pkg.Name()
	filePkgPath := f.Pkg.Path()
	conf := loader.Config{Build: &build.Default}

	// Choose types.Sizes from conf.Build.
	var wordSize int64 = 8
	switch conf.Build.GOARCH {
	case "386", "arm":
		panic("SIMD invalid for x86 and arm")
	}
	conf.TypeChecker.Sizes = &types.StdSizes{
		MaxAlign: 8,
		WordSize: wordSize,
	}

	// Use the initial file from the command line/$GOFILE.
	conf.CreateFromFilenames(filePath(file), file)

	// Load, parse and type-check
	iprog, err := conf.Load()
	if err != nil {
		log.Fatalf("conf.Load, error msg \"%v\"", err)
	}

	// Create and build SSA-form program representation.
	builderMode := ssa.SanityCheckFunctions
	if *ssaDump {
		builderMode = ssa.PrintFunctions
	}
	prog := ssautil.CreateProgram(iprog, builderMode)
	if prog == nil {
		log.Fatalf("Couldn't create ssa representation")
	}
	// Build and display only the initial packages (and synthetic wrappers)
	for _, info := range iprog.InitialPackages() {
		prog.Package(info.Pkg).Build()
	}

	opcodefile := "codegen/instructionsetxml/Opcodes/opcodes/x86_64.xml"
	foundpkg := false
	foundfn := false
	for _, pkg := range prog.AllPackages() {
		if pkg.Pkg.Path() == filePkgPath+"/" && pkg.Pkg.Name() == filePkgName {
			foundpkg = true
			if fn := pkg.Func(funcName); fn == nil {
				msg := "Function \"%v\" not found in package \"%v\""
				log.Fatalf(msg, funcName, filePkgName)
			} else {
				foundfn = true
				codegenFn, err := codegen.CreateFunction(opcodefile, fn)
				if err != nil {
					msg := "codegen.CreateFunction,  error msg \"%v\""
					log.Fatalf(msg, err)
				}
				if asm, err := codegenFn.GoAssembly(); err != nil {
					msg := "Error creating fn asm, error msg \"%v\"\n"
					log.Fatalf(msg, err)
				} else {
					if *outputFile == "" {
						fmt.Println(asm)
					} else {
						writeFile(*outputFile, asm)
					}
				}
			}
		}
	}
	if !foundpkg {
		msg := "Didn't find package, \"%v\", for function \"%v\""
		log.Fatalf(msg, filePkgName, funcName)

	} else if foundpkg && !foundfn {
		msg := "Didn't find function, \"%v\", in package \"%v\""
		log.Fatalf(msg, funcName, filePkgName)
	}
}

func writeFile(filename, contents string) {
	if err := ioutil.WriteFile(filename, []byte(contents), 0644); err != nil {
		log.Fatalf("Error writing to file, error msg \"%v\"\n", err)
	}
}
