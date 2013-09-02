<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <title></title>
  <meta name="Generator" content="Cocoa HTML Writer">
  <meta name="CocoaVersion" content="1187.39">
  <style type="text/css">
    p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica}
    p.p2 {margin: 0.0px 0.0px 0.0px 0.0px; font: 12.0px Helvetica; min-height: 14.0px}
  </style>
</head>
<body>
<p class="p1">TEMPLATE = app</p>
<p class="p1">TARGET = goldcoin-qt</p>
<p class="p1">macx:TARGET = "GoldCoin-Qt"</p>
<p class="p1">VERSION = 0.6.9.4</p>
<p class="p1">INCLUDEPATH += src src/json src/qt</p>
<p class="p1">QT += network</p>
<p class="p2"><br></p>
<p class="p1">DEFINES += QT_GUI BOOST_THREAD_USE_LIB BOOST_SPIRIT_THREADSAFE QT_STATIC_BUILD</p>
<p class="p1">CONFIG += no_include_pwd</p>
<p class="p1">CONFIG += thread</p>
<p class="p1">CONFIG += static</p>
<p class="p2"><br></p>
<p class="p2"><br></p>
<p class="p1"># for boost 1.37, add -mt to the boost libraries</p>
<p class="p1"># use: qmake BOOST_LIB_SUFFIX=-mt</p>
<p class="p1"># for boost thread win32 with _win32 sufix</p>
<p class="p1"># use: BOOST_THREAD_LIB_SUFFIX=_win32-...</p>
<p class="p1"># or when linking against a specific BerkelyDB version: BDB_LIB_SUFFIX=-4.8</p>
<p class="p2"><br></p>
<p class="p1"># Dependency library locations can be customized with:</p>
<p class="p1">#<span class="Apple-converted-space">    </span>BOOST_INCLUDE_PATH, BOOST_LIB_PATH, BDB_INCLUDE_PATH,</p>
<p class="p1">#<span class="Apple-converted-space">    </span>BDB_LIB_PATH, OPENSSL_INCLUDE_PATH and OPENSSL_LIB_PATH respectively</p>
<p class="p2"><br></p>
<p class="p1">OBJECTS_DIR = build</p>
<p class="p1">MOC_DIR = build</p>
<p class="p1">UI_DIR = build</p>
<p class="p2"><br></p>
<p class="p1"># use: qmake "RELEASE=1"</p>
<p class="p1">contains(RELEASE, 1) {</p>
<p class="p1"><span class="Apple-converted-space">    </span># Mac: compile for maximum compatibility (10.5, 32-bit)</p>
<p class="p1"><span class="Apple-converted-space">    </span>macx:QMAKE_CXXFLAGS += -mmacosx-version-min=10.5 -arch i386 -isysroot /Developer/SDKs/MacOSX10.5.sdk</p>
<p class="p1"><span class="Apple-converted-space">    </span>macx:QMAKE_CFLAGS += -mmacosx-version-min=10.5 -arch i386 -isysroot /Developer/SDKs/MacOSX10.5.sdk</p>
<p class="p1"><span class="Apple-converted-space">    </span>macx:QMAKE_OBJECTIVE_CFLAGS += -mmacosx-version-min=10.5 -arch i386 -isysroot /Developer/SDKs/MacOSX10.5.sdk</p>
<p class="p2"><br></p>
<p class="p1"><span class="Apple-converted-space">    </span>!win32:!macx {</p>
<p class="p1"><span class="Apple-converted-space">        </span># Linux: static link and extra security (see: https://wiki.debian.org/Hardening)</p>
<p class="p1"><span class="Apple-converted-space">        </span>LIBS += -Wl,-Bstatic -Wl,-z,relro -Wl,-z,now</p>
<p class="p1"><span class="Apple-converted-space">    </span>}</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">!win32 {</p>
<p class="p1"><span class="Apple-converted-space">    </span># for extra security against potential buffer overflows: enable GCCs Stack Smashing Protection</p>
<p class="p1"><span class="Apple-converted-space">    </span>QMAKE_CXXFLAGS *= -fstack-protector-all</p>
<p class="p1"><span class="Apple-converted-space">    </span>QMAKE_LFLAGS *= -fstack-protector-all</p>
<p class="p1"><span class="Apple-converted-space">    </span># Exclude on Windows cross compile with MinGW 4.2.x, as it will result in a non-working executable!</p>
<p class="p1"><span class="Apple-converted-space">    </span># This can be enabled for Windows, when we switch to MinGW &gt;= 4.4.x.</p>
<p class="p1">}</p>
<p class="p1"># for extra security (see: https://wiki.debian.org/Hardening): this flag is GCC compiler-specific</p>
<p class="p1">QMAKE_CXXFLAGS *= -D_FORTIFY_SOURCE=2</p>
<p class="p1"># for extra security on Windows: enable ASLR and DEP via GCC linker flags</p>
<p class="p1">win32:QMAKE_LFLAGS *= -Wl,--dynamicbase -Wl,--nxcompat</p>
<p class="p1"># on Windows: enable GCC large address aware linker flag</p>
<p class="p1">win32:QMAKE_LFLAGS *= -Wl,--large-address-aware</p>
<p class="p2"><br></p>
<p class="p1"># use: qmake "USE_QRCODE=1"</p>
<p class="p1"># libqrencode (http://fukuchi.org/works/qrencode/index.en.html) must be installed for support</p>
<p class="p1">contains(USE_QRCODE, 1) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>message(Building with QRCode support)</p>
<p class="p1"><span class="Apple-converted-space">    </span>DEFINES += USE_QRCODE</p>
<p class="p1"><span class="Apple-converted-space">    </span>LIBS += -lqrencode</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1"># use: qmake "USE_UPNP=1" ( enabled by default; default)</p>
<p class="p1">#<span class="Apple-converted-space">  </span>or: qmake "USE_UPNP=0" (disabled by default)</p>
<p class="p1">#<span class="Apple-converted-space">  </span>or: qmake "USE_UPNP=-" (not supported)</p>
<p class="p1"># miniupnpc (http://miniupnp.free.fr/files/) must be installed for support</p>
<p class="p1">contains(USE_UPNP, -) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>message(Building without UPNP support)</p>
<p class="p1">} else {</p>
<p class="p1"><span class="Apple-converted-space">    </span>message(Building with UPNP support)</p>
<p class="p1"><span class="Apple-converted-space">    </span>count(USE_UPNP, 0) {</p>
<p class="p1"><span class="Apple-converted-space">        </span>USE_UPNP=1</p>
<p class="p1"><span class="Apple-converted-space">    </span>}</p>
<p class="p1"><span class="Apple-converted-space">    </span>DEFINES += USE_UPNP=$$USE_UPNP STATICLIB</p>
<p class="p1"><span class="Apple-converted-space">    </span>INCLUDEPATH += $$MINIUPNPC_INCLUDE_PATH</p>
<p class="p1"><span class="Apple-converted-space">    </span>LIBS += $$join(MINIUPNPC_LIB_PATH,,-L,) -lminiupnpc</p>
<p class="p1"><span class="Apple-converted-space">    </span>win32:LIBS += -liphlpapi</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1"># use: qmake "USE_DBUS=1"</p>
<p class="p1">contains(USE_DBUS, 1) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>message(Building with DBUS (Freedesktop notifications) support)</p>
<p class="p1"><span class="Apple-converted-space">    </span>DEFINES += USE_DBUS</p>
<p class="p1"><span class="Apple-converted-space">    </span>QT += dbus</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1"># use: qmake "USE_IPV6=1" ( enabled by default; default)</p>
<p class="p1">#<span class="Apple-converted-space">  </span>or: qmake "USE_IPV6=0" (disabled by default)</p>
<p class="p1">#<span class="Apple-converted-space">  </span>or: qmake "USE_IPV6=-" (not supported)</p>
<p class="p1">contains(USE_IPV6, -) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>message(Building without IPv6 support)</p>
<p class="p1">} else {</p>
<p class="p1"><span class="Apple-converted-space">    </span>count(USE_IPV6, 0) {</p>
<p class="p1"><span class="Apple-converted-space">        </span>USE_IPV6=1</p>
<p class="p1"><span class="Apple-converted-space">    </span>}</p>
<p class="p1"><span class="Apple-converted-space">    </span>DEFINES += USE_IPV6=$$USE_IPV6</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">contains(BITCOIN_NEED_QT_PLUGINS, 1) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>DEFINES += BITCOIN_NEED_QT_PLUGINS</p>
<p class="p1"><span class="Apple-converted-space">    </span>QTPLUGIN += qcncodecs qjpcodecs qtwcodecs qkrcodecs qtaccessiblewidgets</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">#INCLUDEPATH += src/leveldb/include src/leveldb/helpers</p>
<p class="p1">#LIBS += $$PWD/src/leveldb/libleveldb.a $$PWD/src/leveldb/libmemenv.a</p>
<p class="p1">#!win32 {</p>
<p class="p1">#<span class="Apple-converted-space">    </span># we use QMAKE_CXXFLAGS_RELEASE even without RELEASE=1 because we use RELEASE to indicate linking preferences not -O preferences</p>
<p class="p1">#<span class="Apple-converted-space">    </span>genleveldb.commands = cd $$PWD/src/leveldb &amp;&amp; CC=$$QMAKE_CC CXX=$$QMAKE_CXX $(MAKE) OPT=\"$$QMAKE_CXXFLAGS $$QMAKE_CXXFLAGS_RELEASE\" libleveldb.a libmemenv.a</p>
<p class="p1">#} else {</p>
<p class="p1">#<span class="Apple-converted-space">    </span># make an educated guess about what the ranlib command is called</p>
<p class="p1">#<span class="Apple-converted-space">    </span>isEmpty(QMAKE_RANLIB) {</p>
<p class="p1">#<span class="Apple-converted-space">        </span>QMAKE_RANLIB = $$replace(QMAKE_STRIP, strip, ranlib)</p>
<p class="p1">#<span class="Apple-converted-space">    </span>}</p>
<p class="p1">#<span class="Apple-converted-space">    </span>LIBS += -lshlwapi</p>
<p class="p1">#<span class="Apple-converted-space">    </span>genleveldb.commands = cd $$PWD/src/leveldb &amp;&amp; CC=$$QMAKE_CC CXX=$$QMAKE_CXX TARGET_OS=OS_WINDOWS_CROSSCOMPILE $(MAKE) OPT=\"$$QMAKE_CXXFLAGS $$QMAKE_CXXFLAGS_RELEASE\" libleveldb.a libmemenv.a &amp;&amp; $$QMAKE_RANLIB $$PWD/src/leveldb/libleveldb.a &amp;&amp; $$QMAKE_RANLIB $$PWD/src/leveldb/libmemenv.a</p>
<p class="p1">#}</p>
<p class="p1">#genleveldb.target = $$PWD/src/leveldb/libleveldb.a</p>
<p class="p1">#genleveldb.depends = FORCE</p>
<p class="p1">#PRE_TARGETDEPS += $$PWD/src/leveldb/libleveldb.a</p>
<p class="p1">#QMAKE_EXTRA_TARGETS += genleveldb</p>
<p class="p1"># Gross ugly hack that depends on qmake internals, unfortunately there is no other way to do it.</p>
<p class="p1">#QMAKE_CLEAN += $$PWD/src/leveldb/libleveldb.a; cd $$PWD/src/leveldb ; $(MAKE) clean</p>
<p class="p2"><br></p>
<p class="p1"># regenerate src/build.h</p>
<p class="p1">!win32|contains(USE_BUILD_INFO, 1) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>genbuild.depends = FORCE</p>
<p class="p1"><span class="Apple-converted-space">    </span>genbuild.commands = cd $$PWD; /bin/sh share/genbuild.sh $$OUT_PWD/build/build.h</p>
<p class="p1"><span class="Apple-converted-space">    </span>genbuild.target = $$OUT_PWD/build/build.h</p>
<p class="p1"><span class="Apple-converted-space">    </span>PRE_TARGETDEPS += $$OUT_PWD/build/build.h</p>
<p class="p1"><span class="Apple-converted-space">    </span>QMAKE_EXTRA_TARGETS += genbuild</p>
<p class="p1"><span class="Apple-converted-space">    </span>DEFINES += HAVE_BUILD_INFO</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">QMAKE_CXXFLAGS_WARN_ON = -fdiagnostics-show-option -Wall -Wextra -Wformat -Wformat-security -Wno-unused-parameter -Wstack-protector</p>
<p class="p2"><br></p>
<p class="p1"># Input</p>
<p class="p1">DEPENDPATH += src src/json src/qt</p>
<p class="p1">HEADERS += src/qt/bitcoingui.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactiontablemodel.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/addresstablemodel.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/optionsdialog.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/sendcoinsdialog.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/addressbookpage.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/signverifymessagedialog.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/aboutdialog.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/editaddressdialog.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/bitcoinaddressvalidator.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/addrman.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/base58.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/bignum.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/checkpoints.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/compat.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/sync.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/util.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/uint256.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/serialize.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/strlcpy.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/main.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/net.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/key.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/db.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/walletdb.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/script.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/init.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/irc.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/mruset.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_writer_template.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_writer.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_value.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_utils.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_stream_reader.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_reader_template.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_reader.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_error_position.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/clientmodel.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/guiutil.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactionrecord.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/guiconstants.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/optionsmodel.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/monitoreddatamapper.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactiondesc.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactiondescdialog.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/bitcoinamountfield.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/wallet.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/keystore.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactionfilterproxy.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactionview.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/walletmodel.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/bitcoinrpc.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/overviewpage.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/csvmodelwriter.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/crypter.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/sendcoinsentry.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/qvalidatedlineedit.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/bitcoinunits.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/qvaluecombobox.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/askpassphrasedialog.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/protocol.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/notificator.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/qtipcserver.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/allocators.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/ui_interface.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/scrypt.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/miningpage.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/version.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/rpcconsole.h</p>
<p class="p2"><br></p>
<p class="p1">SOURCES += src/qt/bitcoin.cpp src/qt/bitcoingui.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactiontablemodel.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/addresstablemodel.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/optionsdialog.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/sendcoinsdialog.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/addressbookpage.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/signverifymessagedialog.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/aboutdialog.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/editaddressdialog.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/bitcoinaddressvalidator.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/version.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/sync.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/util.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/netbase.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/key.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/script.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/main.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/init.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/net.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/irc.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/checkpoints.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/addrman.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/db.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/walletdb.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_writer.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_value.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/json/json_spirit_reader.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/clientmodel.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/guiutil.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactionrecord.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/optionsmodel.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/monitoreddatamapper.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactiondesc.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactiondescdialog.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/bitcoinstrings.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/bitcoinamountfield.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/wallet.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/keystore.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactionfilterproxy.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/transactionview.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/walletmodel.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/bitcoinrpc.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/rpcdump.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/rpcnet.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/rpcrawtransaction.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/overviewpage.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/csvmodelwriter.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/crypter.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/sendcoinsentry.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/qvalidatedlineedit.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/bitcoinunits.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/qvaluecombobox.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/askpassphrasedialog.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/protocol.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/notificator.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/qtipcserver.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/rpcconsole.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/scrypt.c \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/miningpage.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/noui.cpp</p>
<p class="p2"><br></p>
<p class="p1">RESOURCES += \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/bitcoin.qrc</p>
<p class="p2"><br></p>
<p class="p1">FORMS += \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/sendcoinsdialog.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/addressbookpage.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/signverifymessagedialog.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/aboutdialog.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/editaddressdialog.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/transactiondescdialog.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/overviewpage.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/sendcoinsentry.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/askpassphrasedialog.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/rpcconsole.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/miningpage.ui \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/forms/optionsdialog.ui</p>
<p class="p2"><br></p>
<p class="p1">contains(USE_QRCODE, 1) {</p>
<p class="p1">HEADERS += src/qt/qrcodedialog.h</p>
<p class="p1">SOURCES += src/qt/qrcodedialog.cpp</p>
<p class="p1">FORMS += src/qt/forms/qrcodedialog.ui</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">contains(BITCOIN_QT_TEST, 1) {</p>
<p class="p1">SOURCES += src/qt/test/test_main.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/test/uritests.cpp</p>
<p class="p1">HEADERS += src/qt/test/uritests.h</p>
<p class="p1">DEPENDPATH += src/qt/test</p>
<p class="p1">QT += testlib</p>
<p class="p1">TARGET = bitcoin-qt_test</p>
<p class="p1">DEFINES += BITCOIN_QT_TEST</p>
<p class="p1"><span class="Apple-converted-space">  </span>macx: CONFIG -= app_bundle</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p2"><br></p>
<p class="p1">CODECFORTR = UTF-8</p>
<p class="p2"><br></p>
<p class="p1"># for lrelease/lupdate</p>
<p class="p1"># also add new translations to src/qt/bitcoin.qrc under translations/</p>
<p class="p1">TRANSLATIONS = $$files(src/qt/locale/bitcoin_*.ts)</p>
<p class="p2"><br></p>
<p class="p1">isEmpty(QMAKE_LRELEASE) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>win32:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]\\lrelease.exe</p>
<p class="p1"><span class="Apple-converted-space">    </span>else:QMAKE_LRELEASE = $$[QT_INSTALL_BINS]/lrelease</p>
<p class="p1">}</p>
<p class="p1">isEmpty(QM_DIR):QM_DIR = $$PWD/src/qt/locale</p>
<p class="p1"># automatically build translations, so they can be included in resource file</p>
<p class="p1">TSQM.name = lrelease ${QMAKE_FILE_IN}</p>
<p class="p1">TSQM.input = TRANSLATIONS</p>
<p class="p1">TSQM.output = $$QM_DIR/${QMAKE_FILE_BASE}.qm</p>
<p class="p1">TSQM.commands = $$QMAKE_LRELEASE ${QMAKE_FILE_IN} -qm ${QMAKE_FILE_OUT}</p>
<p class="p1">TSQM.CONFIG = no_link</p>
<p class="p1">QMAKE_EXTRA_COMPILERS += TSQM</p>
<p class="p2"><br></p>
<p class="p1"># "Other files" to show in Qt Creator</p>
<p class="p1">OTHER_FILES += README.md \</p>
<p class="p1"><span class="Apple-converted-space">    </span>doc/*.rst \</p>
<p class="p1"><span class="Apple-converted-space">    </span>doc/*.txt \</p>
<p class="p2"><br></p>
<p class="p1"><span class="Apple-converted-space">    </span>doc/README \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/res/bitcoin-qt.rc \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/test/*.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/test/*.h \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/test/*.cpp \</p>
<p class="p1"><span class="Apple-converted-space">    </span>src/qt/test/*.h</p>
<p class="p2"><br></p>
<p class="p1"># platform specific defaults, if not overridden on command line</p>
<p class="p1">isEmpty(BOOST_LIB_SUFFIX) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>macx:BOOST_LIB_SUFFIX = -mt</p>
<p class="p1"><span class="Apple-converted-space">    </span>win32:BOOST_LIB_SUFFIX = -mgw44-mt-s-1_50</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">isEmpty(BOOST_THREAD_LIB_SUFFIX) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>BOOST_THREAD_LIB_SUFFIX = $$BOOST_LIB_SUFFIX</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">isEmpty(BDB_LIB_PATH) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>macx:BDB_LIB_PATH = /opt/local/lib/db48</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">isEmpty(BDB_LIB_SUFFIX) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>macx:BDB_LIB_SUFFIX = -4.8</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">isEmpty(BDB_INCLUDE_PATH) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>macx:BDB_INCLUDE_PATH = /opt/local/include/db48</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">isEmpty(BOOST_LIB_PATH) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>macx:BOOST_LIB_PATH = /opt/local/lib</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">isEmpty(BOOST_INCLUDE_PATH) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>macx:BOOST_INCLUDE_PATH = /opt/local/include</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">win32:DEFINES += WIN32</p>
<p class="p1">win32:RC_FILE = src/qt/res/bitcoin-qt.rc</p>
<p class="p2"><br></p>
<p class="p1">win32:!contains(MINGW_THREAD_BUGFIX, 0) {</p>
<p class="p1"><span class="Apple-converted-space">    </span># At least qmake's win32-g++-cross profile is missing the -lmingwthrd</p>
<p class="p1"><span class="Apple-converted-space">    </span># thread-safety flag. GCC has -mthreads to enable this, but it doesn't</p>
<p class="p1"><span class="Apple-converted-space">    </span># work with static linking. -lmingwthrd must come BEFORE -lmingw, so</p>
<p class="p1"><span class="Apple-converted-space">    </span># it is prepended to QMAKE_LIBS_QT_ENTRY.</p>
<p class="p1"><span class="Apple-converted-space">    </span># It can be turned off with MINGW_THREAD_BUGFIX=0, just in case it causes</p>
<p class="p1"><span class="Apple-converted-space">    </span># any problems on some untested qmake profile now or in the future.</p>
<p class="p1"><span class="Apple-converted-space">    </span>DEFINES += _MT</p>
<p class="p1"><span class="Apple-converted-space">    </span>QMAKE_LIBS_QT_ENTRY = -lmingwthrd $$QMAKE_LIBS_QT_ENTRY</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">!win32:!macx {</p>
<p class="p1"><span class="Apple-converted-space">    </span>DEFINES += LINUX</p>
<p class="p1"><span class="Apple-converted-space">    </span>LIBS += -lrt</p>
<p class="p1"><span class="Apple-converted-space">    </span># _FILE_OFFSET_BITS=64 lets 32-bit fopen transparently support large files.</p>
<p class="p1"><span class="Apple-converted-space">    </span>DEFINES += _FILE_OFFSET_BITS=64</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">macx:HEADERS += src/qt/macdockiconhandler.h</p>
<p class="p1">macx:OBJECTIVE_SOURCES += src/qt/macdockiconhandler.mm</p>
<p class="p1">macx:LIBS += -framework Foundation -framework ApplicationServices -framework AppKit</p>
<p class="p1">macx:DEFINES += MAC_OSX MSG_NOSIGNAL=0</p>
<p class="p1">macx:ICON = src/qt/res/icons/bitcoin.icns</p>
<p class="p1">macx:QMAKE_CFLAGS_THREAD += -pthread</p>
<p class="p1">macx:QMAKE_LFLAGS_THREAD += -pthread</p>
<p class="p2"><br></p>
<p class="p2"><br></p>
<p class="p2"><br></p>
<p class="p1">macx:QMAKE_CXXFLAGS_THREAD += -pthread</p>
<p class="p1">macx:QMAKE_INFO_PLIST = share/qt/Info.plist</p>
<p class="p2"><br></p>
<p class="p1"># Set libraries and includes at end, to use platform-defined defaults if not overridden</p>
<p class="p1">INCLUDEPATH += $$BOOST_INCLUDE_PATH $$BDB_INCLUDE_PATH $$OPENSSL_INCLUDE_PATH $$QRENCODE_INCLUDE_PATH</p>
<p class="p1">LIBS += $$join(BOOST_LIB_PATH,,-L,) $$join(BDB_LIB_PATH,,-L,) $$join(OPENSSL_LIB_PATH,,-L,) $$join(QRENCODE_LIB_PATH,,-L,)</p>
<p class="p1">LIBS += -lssl -lcrypto -ldb_cxx$$BDB_LIB_SUFFIX</p>
<p class="p1"># -lgdi32 has to happen after -lcrypto (see<span class="Apple-converted-space">  </span>#681)</p>
<p class="p1">win32:LIBS += -lws2_32 -lshlwapi -lmswsock -lole32 -loleaut32 -luuid -lgdi32</p>
<p class="p1">LIBS += -lboost_system$$BOOST_LIB_SUFFIX -lboost_filesystem$$BOOST_LIB_SUFFIX -lboost_program_options$$BOOST_LIB_SUFFIX -lboost_thread$$BOOST_THREAD_LIB_SUFFIX</p>
<p class="p1">win32:LIBS += -lboost_chrono$$BOOST_LIB_SUFFIX</p>
<p class="p1">macx:LIBS += -lboost_chrono$$BOOST_LIB_SUFFIX</p>
<p class="p2"><br></p>
<p class="p1">contains(RELEASE, 1) {</p>
<p class="p1"><span class="Apple-converted-space">    </span>!win32:!macx {</p>
<p class="p1"><span class="Apple-converted-space">        </span># Linux: turn dynamic linking back on for c/c++ runtime libraries</p>
<p class="p1"><span class="Apple-converted-space">        </span>LIBS += -Wl,-Bdynamic</p>
<p class="p1"><span class="Apple-converted-space">    </span>}</p>
<p class="p1">}</p>
<p class="p2"><br></p>
<p class="p1">system($$QMAKE_LRELEASE -silent $$TRANSLATIONS)</p>
</body>
</html>
