# ---------------------------------------------------------
# type the "make" command to create report.pdf 
# ---------------------------------------------------------

#doc name
FILE=report

#list of LibreOffice Draw files
LODFIGS = $(patsubst %.odg,%.pdf,$(wildcard *.odg))

all: $(FILE).pdf
	evince $< &

$(FILE).pdf: $(wildcard *.tex) $(LODFIGS)
	cp -f ../mat1/*.tex .
	cp -f ../mat2/*.tex .
	cp -f ../mat4/*.tex .
	cp -f ../sim1/*.tex .
	cp -f ../sim2/*.tex .
	cp -f ../mat3/*.eps .
	cp -f ../mat4/*.eps .
	cp -f ../mat5/*.eps .
	cp -f ../mat6/*.eps .
	cp -f ../sim3/*.pdf .
	cp -f ../sim4/*.pdf .
	cp -f ../sim5/*.pdf .
	
	pdflatex  $(FILE).tex
	pdflatex  $(FILE).tex
	pdflatex  $(FILE).tex
	


#convert libreoffice draw figures to pdf
%.pdf: %.odg
	soffice --headless --convert-to pdf $<

clean:
	@rm -rf *.aux *.bbl *.blg *.glg *.glo *.gls *.ilg *.ist *.lof
	@rm -rf *.log *.lot *.nlo *.nls *.out *.toc *~ *.*% ./*.pdf ./*.eps

.PHONY: all clean


