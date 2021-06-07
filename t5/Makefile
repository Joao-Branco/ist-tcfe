# ------------------------------------------------------------
# type "make" command in the Linux terminal create report.pdf
#
# type "make clean" to delete all generated files
# ------------------------------------------------------------

all:
	make -C mat1	
	make -C sim1
	make -C doc
	cp doc/report.pdf .

clean:
	make -C mat1 clean
	make -C sim1 clean
	make -C doc clean

.PHONY: all clean


