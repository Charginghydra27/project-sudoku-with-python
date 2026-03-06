import sys
from clingo.application import Application, clingo_main


class SudokuApp(Application):
    program_name = "sudoku1"

    def main(self, control, files):
        control.load("sudoku.lp")

        for file_name in files:
            control.load(file_name)

        control.ground([("base", [])])
        control.solve()


if __name__ == "__main__":
    clingo_main(SudokuApp(), sys.argv[1:])