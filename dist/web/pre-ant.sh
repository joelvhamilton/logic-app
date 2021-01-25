#!/bin/bash

# Set up stuff to prep antpack

set -e

mkdir -p ant-ws

# swap /home/runner with real home dir
sed -i -e "s;/home/runner/\\.m2;$HOME/\\.m2;" antpack.xml

cp ../jar-in-jar-loader.zip ./

# Get xtext web dependencies from dev server

# The following is from eclipse's run config. Replace it whenever we add new dependencies.
# Also be sure to make the paths relative.
java -Dfile.encoding=UTF-8 -classpath ../../za.org.cair.logic_app.web/target/classes:/home/runner/Projects/logic-app/za.org.cair.logic_app/target/classes:/home/runner/.p2/pool/plugins/org.junit.jupiter.api_5.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.junit.jupiter.engine_5.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.junit.jupiter.migrationsupport_5.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.junit.jupiter.params_5.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.junit.platform.commons_1.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.junit.platform.engine_1.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.junit.platform.launcher_1.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.junit.platform.runner_1.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.junit.platform.suite.api_1.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.junit.vintage.engine_5.7.0.v20201026-1537.jar:/home/runner/.p2/pool/plugins/org.opentest4j_1.2.0.v20190826-0900.jar:/home/runner/.p2/pool/plugins/org.apiguardian_1.1.0.v20190826-0900.jar:/home/runner/.p2/pool/plugins/org.junit_4.13.0.v20200204-1500.jar:/home/runner/.p2/pool/plugins/org.hamcrest.core_1.3.0.v20180420-1519.jar:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext/2.24.0/org.eclipse.xtext-2.24.0.jar:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext.util/2.24.0/org.eclipse.xtext.util-2.24.0.jar:/home/runner/.m2/repository/org/eclipse/emf/org.eclipse.emf.ecore/2.20.0/org.eclipse.emf.ecore-2.20.0.jar:/home/runner/.m2/repository/log4j/log4j/1.2.17/log4j-1.2.17.jar:/home/runner/.m2/repository/org/eclipse/platform/org.eclipse.equinox.common/3.13.0/org.eclipse.equinox.common-3.13.0.jar:/home/runner/.m2/repository/org/eclipse/platform/org.eclipse.osgi/3.16.0/org.eclipse.osgi-3.16.0.jar:/home/runner/.m2/repository/org/eclipse/emf/org.eclipse.emf.common/2.17.0/org.eclipse.emf.common-2.17.0.jar:/home/runner/.m2/repository/org/eclipse/emf/org.eclipse.emf.ecore.xmi/2.16.0/org.eclipse.emf.ecore.xmi-2.16.0.jar:/home/runner/.m2/repository/com/google/inject/guice/3.0/guice-3.0.jar:/home/runner/.m2/repository/javax/inject/javax.inject/1/javax.inject-1.jar:/home/runner/.m2/repository/aopalliance/aopalliance/1.0/aopalliance-1.0.jar:/home/runner/.m2/repository/org/antlr/antlr-runtime/3.2/antlr-runtime-3.2.jar:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext.xbase/2.24.0/org.eclipse.xtext.xbase-2.24.0.jar:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext.common.types/2.24.0/org.eclipse.xtext.common.types-2.24.0.jar:/home/runner/.m2/repository/io/github/classgraph/classgraph/4.8.35/classgraph-4.8.35.jar:../../za.org.cair.logic_app.ide/target/classes:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext.ide/2.24.0/org.eclipse.xtext.ide-2.24.0.jar:/home/runner/.m2/repository/org/eclipse/emf/org.eclipse.emf.ecore.change/2.14.0/org.eclipse.emf.ecore.change-2.14.0.jar:/home/runner/.m2/repository/org/eclipse/lsp4j/org.eclipse.lsp4j/0.10.0/org.eclipse.lsp4j-0.10.0.jar:/home/runner/.m2/repository/org/eclipse/lsp4j/org.eclipse.lsp4j.generator/0.10.0/org.eclipse.lsp4j.generator-0.10.0.jar:/home/runner/.m2/repository/org/eclipse/lsp4j/org.eclipse.lsp4j.jsonrpc/0.10.0/org.eclipse.lsp4j.jsonrpc-0.10.0.jar:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext.xbase.ide/2.24.0/org.eclipse.xtext.xbase.ide-2.24.0.jar:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext.xbase.web/2.24.0/org.eclipse.xtext.xbase.web-2.24.0.jar:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext.web/2.24.0/org.eclipse.xtext.web-2.24.0.jar:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext.web.servlet/2.24.0/org.eclipse.xtext.web.servlet-2.24.0.jar:/home/runner/.m2/repository/com/google/code/gson/gson/2.8.2/gson-2.8.2.jar:/home/runner/.m2/repository/org/eclipse/xtend/org.eclipse.xtend.lib/2.24.0/org.eclipse.xtend.lib-2.24.0.jar:/home/runner/.m2/repository/org/eclipse/xtext/org.eclipse.xtext.xbase.lib/2.24.0/org.eclipse.xtext.xbase.lib-2.24.0.jar:/home/runner/.m2/repository/com/google/guava/guava/27.1-jre/guava-27.1-jre.jar:/home/runner/.m2/repository/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar:/home/runner/.m2/repository/com/google/guava/listenablefuture/9999.0-empty-to-avoid-conflict-with-guava/listenablefuture-9999.0-empty-to-avoid-conflict-with-guava.jar:/home/runner/.m2/repository/com/google/code/findbugs/jsr305/3.0.2/jsr305-3.0.2.jar:/home/runner/.m2/repository/org/checkerframework/checker-qual/2.5.2/checker-qual-2.5.2.jar:/home/runner/.m2/repository/com/google/errorprone/error_prone_annotations/2.2.0/error_prone_annotations-2.2.0.jar:/home/runner/.m2/repository/com/google/j2objc/j2objc-annotations/1.1/j2objc-annotations-1.1.jar:/home/runner/.m2/repository/org/codehaus/mojo/animal-sniffer-annotations/1.17/animal-sniffer-annotations-1.17.jar:/home/runner/.m2/repository/org/eclipse/xtend/org.eclipse.xtend.lib.macro/2.24.0/org.eclipse.xtend.lib.macro-2.24.0.jar:/home/runner/.m2/repository/org/webjars/requirejs/2.3.6/requirejs-2.3.6.jar:/home/runner/.m2/repository/org/webjars/jquery/3.5.1/jquery-3.5.1.jar:/home/runner/.m2/repository/org/webjars/ace/1.3.3/ace-1.3.3.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-annotations/9.4.34.v20201102/jetty-annotations-9.4.34.v20201102.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-plus/9.4.34.v20201102/jetty-plus-9.4.34.v20201102.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-jndi/9.4.34.v20201102/jetty-jndi-9.4.34.v20201102.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-util/9.4.34.v20201102/jetty-util-9.4.34.v20201102.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-webapp/9.4.34.v20201102/jetty-webapp-9.4.34.v20201102.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-xml/9.4.34.v20201102/jetty-xml-9.4.34.v20201102.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-servlet/9.4.34.v20201102/jetty-servlet-9.4.34.v20201102.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-security/9.4.34.v20201102/jetty-security-9.4.34.v20201102.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-server/9.4.34.v20201102/jetty-server-9.4.34.v20201102.jar:/home/runner/.m2/repository/javax/servlet/javax.servlet-api/3.1.0/javax.servlet-api-3.1.0.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-http/9.4.34.v20201102/jetty-http-9.4.34.v20201102.jar:/home/runner/.m2/repository/org/eclipse/jetty/jetty-io/9.4.34.v20201102/jetty-io-9.4.34.v20201102.jar:/home/runner/.m2/repository/javax/annotation/javax.annotation-api/1.3.2/javax.annotation-api-1.3.2.jar:/home/runner/.m2/repository/org/ow2/asm/asm/9.0/asm-9.0.jar:/home/runner/.m2/repository/org/ow2/asm/asm-commons/9.0/asm-commons-9.0.jar:/home/runner/.m2/repository/org/ow2/asm/asm-tree/9.0/asm-tree-9.0.jar:/home/runner/.m2/repository/org/ow2/asm/asm-analysis/9.0/asm-analysis-9.0.jar:/home/runner/.m2/repository/org/slf4j/slf4j-simple/1.7.21/slf4j-simple-1.7.21.jar:/home/runner/.m2/repository/org/slf4j/slf4j-api/1.7.21/slf4j-api-1.7.21.jar za.org.cair.logic_app.web.ServerLauncher 8003 > /dev/null 2>&1 &
# the above cmd runs in the background

echo 'Waiting for webserver to boot'
sleep 5

# get those web depends
wget --mirror --reject='*.html*,style.css,jetty-dir.css' --reject-regex '.*ace.*demo.*' -nH -P src/main/webapp/ http://localhost:8003/{xtext,webjars}/

# kill dev webserver
kill %1

# copy in src webapp stuff
cp -r ../../za.org.cair.logic_app.web/src/main/webapp/ src/main/

echo "Done!"

