{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
#if __GLASGOW_HASKELL__ >= 810
{-# OPTIONS_GHC -Wno-prepositive-qualified-module #-}
#endif
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -w #-}
module Paths_aula02 (
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
bindir     = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aula02/.stack-work/install/x86_64-linux/6c515e13c11ed938733cd3bcf28b28f7bab697859866ebae3596153cafdf884f/9.10.3/bin"
libdir     = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aula02/.stack-work/install/x86_64-linux/6c515e13c11ed938733cd3bcf28b28f7bab697859866ebae3596153cafdf884f/9.10.3/lib/x86_64-linux-ghc-9.10.3-415c/aula02-0.1.0.0-9QVeOd9b7GWIvZS2kmDH9M-aula02"
dynlibdir  = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aula02/.stack-work/install/x86_64-linux/6c515e13c11ed938733cd3bcf28b28f7bab697859866ebae3596153cafdf884f/9.10.3/lib/x86_64-linux-ghc-9.10.3-415c"
datadir    = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aula02/.stack-work/install/x86_64-linux/6c515e13c11ed938733cd3bcf28b28f7bab697859866ebae3596153cafdf884f/9.10.3/share/x86_64-linux-ghc-9.10.3-415c/aula02-0.1.0.0"
libexecdir = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aula02/.stack-work/install/x86_64-linux/6c515e13c11ed938733cd3bcf28b28f7bab697859866ebae3596153cafdf884f/9.10.3/libexec/x86_64-linux-ghc-9.10.3-415c/aula02-0.1.0.0"
sysconfdir = "/home/davyusow/Projetos/Haskell/Estudos-Haskell/aula02/.stack-work/install/x86_64-linux/6c515e13c11ed938733cd3bcf28b28f7bab697859866ebae3596153cafdf884f/9.10.3/etc"

getBinDir     = catchIO (getEnv "aula02_bindir")     (\_ -> return bindir)
getLibDir     = catchIO (getEnv "aula02_libdir")     (\_ -> return libdir)
getDynLibDir  = catchIO (getEnv "aula02_dynlibdir")  (\_ -> return dynlibdir)
getDataDir    = catchIO (getEnv "aula02_datadir")    (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "aula02_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "aula02_sysconfdir") (\_ -> return sysconfdir)



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
