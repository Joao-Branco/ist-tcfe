# ------------------------------------------------------------
# type "make" command in the Linux terminal create report.pdf
#
# type "make clean" to delete all generated files
# ------------------------------------------------------------

all:
	make -C mat1
	make -C mat2
	make -C sim
	make -C doc
	cp doc/report.pdf .

clean:
	make -C mat1 clean
	make -C mat2 clean
	make -C sim clean
	make -C doc clean

.PHONY: all clean


