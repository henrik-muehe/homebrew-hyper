require 'formula'

class Ld64 < Formula
  homepage ''
  url 'http://opensource.apple.com/tarballs/ld64/ld64-97.2.tar.gz'
  sha1 '07276960bf9e347bda07ab804be05d5ca002fe8a'

  depends_on 'llvm'
  depends_on 'dyld'
  depends_on 'cctools'
  depends_on 'libunwind'

  def patches
    # fixes include path, disables lto
    DATA
  end

  def install
    system "xcodebuild -arch x86_64"
    bin.install "build/Release/ld"
    bin.install "build/Release/dyldinfo"
    bin.install "build/Release/rebase"
    bin.install "build/Release/unwinddump"
  end

  def test
    system "false"
  end
end

__END__
diff --git a/ld64.xcodeproj/project.pbxproj b/ld64.xcodeproj/project.pbxproj
index 55fd5ea..7e78839 100644
--- a/ld64.xcodeproj/project.pbxproj
+++ b/ld64.xcodeproj/project.pbxproj
@@ -709,6 +709,7 @@
 				HEADER_SEARCH_PATHS = (
 					"$(DEVELOPER_DIR)/usr/local/include",
 					"$(DEVELOPER_DIR)/usr/include",
+					"HOMEBREW_PREFIX/include"
 				);
 				INSTALL_PATH = /usr/bin;
 				LINKER_DISPLAYS_MANGLED_NAMES = NO;
@@ -761,6 +762,7 @@
 				HEADER_SEARCH_PATHS = (
 					"$(DEVELOPER_DIR)/usr/local/include",
 					"$(DEVELOPER_DIR)/usr/include",
+					"HOMEBREW_PREFIX/include"
 				);
 				INSTALL_PATH = /usr/bin;
 				OTHER_CPLUSPLUSFLAGS = "$(OTHER_CPLUSPLUSFLAGS)";
diff --git a/src/ld/ld.cpp b/src/ld/ld.cpp
index 6b6d114..435bcb9 100644
--- a/src/ld/ld.cpp
+++ b/src/ld/ld.cpp
@@ -3270,11 +3270,11 @@ const char* Linker::fileArch(const void* p)
 	result = mach_o::relocatable::Reader<arm>::fileKind(bytes);
 	if ( result != NULL  )
 		 return result;
-		 
+#if LTO_SUPPORT
 	result = lto::Reader::fileKind(bytes);
 	if ( result != NULL  )
 		 return result;
-	
+#endif	
 	return "unsupported file format";	 
 }
 
diff --git a/src/other/ObjectDump.cpp b/src/other/ObjectDump.cpp
index 25352b1..77e1732 100644
--- a/src/other/ObjectDump.cpp
+++ b/src/other/ObjectDump.cpp
@@ -30,8 +30,6 @@
 
 #include "MachOReaderRelocatable.hpp"
 
-#define LTO_SUPPORT 1
-
 #if LTO_SUPPORT
 	#include "LTOReader.hpp"
 #endif

