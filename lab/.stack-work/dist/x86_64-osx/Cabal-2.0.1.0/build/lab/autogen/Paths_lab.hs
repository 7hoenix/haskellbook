{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_lab (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
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
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/j7hoenix/Vault/8th-light/practice/haskell/haskellbook/lab/.stack-work/install/x86_64-osx/lts-11.16/8.2.2/bin"
libdir     = "/Users/j7hoenix/Vault/8th-light/practice/haskell/haskellbook/lab/.stack-work/install/x86_64-osx/lts-11.16/8.2.2/lib/x86_64-osx-ghc-8.2.2/lab-0.1.0.0-59Z90DBKqOt6aeAmYGZARO-lab"
dynlibdir  = "/Users/j7hoenix/Vault/8th-light/practice/haskell/haskellbook/lab/.stack-work/install/x86_64-osx/lts-11.16/8.2.2/lib/x86_64-osx-ghc-8.2.2"
datadir    = "/Users/j7hoenix/Vault/8th-light/practice/haskell/haskellbook/lab/.stack-work/install/x86_64-osx/lts-11.16/8.2.2/share/x86_64-osx-ghc-8.2.2/lab-0.1.0.0"
libexecdir = "/Users/j7hoenix/Vault/8th-light/practice/haskell/haskellbook/lab/.stack-work/install/x86_64-osx/lts-11.16/8.2.2/libexec/x86_64-osx-ghc-8.2.2/lab-0.1.0.0"
sysconfdir = "/Users/j7hoenix/Vault/8th-light/practice/haskell/haskellbook/lab/.stack-work/install/x86_64-osx/lts-11.16/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "lab_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "lab_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "lab_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "lab_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "lab_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "lab_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
