
The `src` dir here is necessary to run the server. Its contents can be generated by a combination of:
- Copying from `za.org.cair.logic_app.web/src/main/webapp/` (happens in `pre-ant.sh`)
- Cloning the webjars from a running dev webserver (because of CI complications, this should be done at dev-time)
```sh
wget --mirror --reject='*.html*,style.css' -nH -P src/main/webapp/ http://localhost:8002/{xtext,webjars}
```
