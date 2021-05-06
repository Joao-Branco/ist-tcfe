all: ngspice.log
	$(eval NGSFIGS=$(shell grep _FIG $< | sed 's/_FIG//g' | sed ':a;N;$!ba;s/\n/ /g'))
	$(eval NGSFIGPS=$(addsuffix .ps, $(NGSFIGS)))
	$(foreach i, $(NGSFIGPS), ps2pdf $i;)
	

ngspice.log: ../sim3/t2.net
	ngspice -b $< -o $@

clean:
	@rm -f ngspice.log *.tex *.pdf *.ps *~

.PHONY: all clean
