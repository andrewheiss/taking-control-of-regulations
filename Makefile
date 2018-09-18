remote_host = cloud
remote_dir = ~/sites/stats/public_html/taking-control-of-regulations
remote_dest = $(remote_host):$(remote_dir)

.PHONY: html upload

html:
	Rscript -e "rmarkdown::render('analysis.Rmd', encoding = 'UTF-8')"

upload:
	rsync -crvP --delete analysis.html $(remote_dest)
