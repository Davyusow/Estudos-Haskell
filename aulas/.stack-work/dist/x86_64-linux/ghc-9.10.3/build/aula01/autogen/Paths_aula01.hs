{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_aula01 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where


import qualified Control.Exception as Exception
import qualified Data.List as List
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude


#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir `joinFileName` name)

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath




bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath
bindir     = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aulas/.stack-work/install/x86_64-linux/6f0379310bb822be762532598c70f0f22155ed8a7abc9a28f879f0665cf4aba6/9.10.3/bin"
libdir     = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aulas/.stack-work/install/x86_64-linux/6f0379310bb822be762532598c70f0f22155ed8a7abc9a28f879f0665cf4aba6/9.10.3/lib/x86_64-linux-ghc-9.10.3-415c/aula01-0.1.0.0-FCuA8TOeGm24B3Qde29s26-aula01"
dynlibdir  = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aulas/.stack-work/install/x86_64-linux/6f0379310bb822be762532598c70f0f22155ed8a7abc9a28f879f0665cf4aba6/9.10.3/lib/x86_64-linux-ghc-9.10.3-415c"
datadir    = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aulas/.stack-work/install/x86_64-linux/6f0379310bb822be762532598c70f0f22155ed8a7abc9a28f879f0665cf4aba6/9.10.3/share/x86_64-linux-ghc-9.10.3-415c/aula01-0.1.0.0"
libexecdir = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aulas/.stack-work/install/x86_64-linux/6f0379310bb822be762532598c70f0f22155ed8a7abc9a28f879f0665cf4aba6/9.10.3/libexec/x86_64-linux-ghc-9.10.3-415c/aula01-0.1.0.0"
sysconfdir = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aulas/.stack-work/install/x86_64-linux/6f0379310bb822be762532598c70f0f22155ed8a7abc9a28f879f0665cf4aba6/9.10.3/etc"

getBinDir     = catchIO (getEnv "aula01_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "aula01_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "aula01_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "aula01_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "aula01_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "aula01_sysconfdir") (\_ -> return sysconfdir)



joinFileName :: String -> String -> FilePath
joinFileName ""  fname = fname
joinFileName "." fname = fname
joinFileName dir ""    = dir
joinFileName dir fname
  | isPathSeparator (List.last dir) = dir ++ fname
  | otherwise                       = dir ++ pathSeparator : fname

pathSeparator :: Char
pathSeparator = '/'

isPathSeparator :: Char -> Bool
isPathSeparator c = c == '/'
