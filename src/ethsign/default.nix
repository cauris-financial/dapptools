{ stdenv, buildGoPackage, fetchFromGitHub, fetchgit, go-ethereum, clang }:

buildGoPackage rec {
  name = "ethsign-${version}";
  version = "0.15.0";

  goPackagePath = "github.com/dapphub/ethsign";
  hardeningDisable = ["fortify"];
  src = ./.;

  extraSrcs = [
    {
      goPackagePath = "github.com/ethereum/go-ethereum";
      src = go-ethereum.src;
    }
    {
      goPackagePath = "github.com/celo-org/celo-blockchain";
      src = fetchFromGitHub {
        owner = "celo-org";
        repo = "celo-blockchain";
        rev = "v1.3.0";
        sha256 = "0lwli3rj91zvia4bb09s6cix4wimy5x7dk1qwl221k266x23h89l";
      };
    }
    {
      goPackagePath = "github.com/VictoriaMetrics/fastcache";
      src = fetchFromGitHub {
        owner = "VictoriaMetrics";
        repo = "fastcache";
        rev = "v1.5.7";
        sha256 = "19fsx8ha2kdjbsinlllz70fj96z6xhvn38x8qrmml0abmsf5z60k";
      };
    }
    {
      goPackagePath = "github.com/aristanetworks/goarista";
      src = fetchFromGitHub {
        owner = "aristanetworks";
        repo = "goarista";
        rev = "ockafka-v0.0.5";
        sha256 = "0qhmn83cny1299rli2x8n2rw844gfwscsldrnl107vi8mv88r0xw";
      };
    }
    {
      goPackagePath = "github.com/celo-org/celo-bls-go";
      src = fetchFromGitHub {
        owner = "celo-org";
        repo = "celo-bls-go";
        rev = "v0.2.5";
        sha256 = "02a7nrww3a901gj7v3i8nwzznq3k0b95zrmn66lh5rcidjx2by5n";
      };
    }
    {
      goPackagePath = "github.com/cespare/xxhash";
      src = fetchFromGitHub {
        owner = "cespare";
        repo = "xxhash";
        rev = "v2.0.0";
        sha256 = "1cpxfjamywjvm1530cdg7li60yabgby1a4ispina1a39h1f3c92k";
      };
    }
    {
      goPackagePath = "github.com/elastic/gosigar";
      src = fetchFromGitHub {
        owner = "elastic";
        repo = "gosigar";
        rev = "v0.14.1";
        sha256 = "1l4sfcv81sqf6yx4jdbf9civpp96h8mpf39rxf03ydlg7bc6djnf";
      };
    }
    {
      goPackagePath = "github.com/go-stack/stack";
      src = fetchFromGitHub {
        owner = "go-stack";
        repo = "stack";
        rev = "v1.8.0";
        sha256 = "0wk25751ryyvxclyp8jdk5c3ar0cmfr8lrjb66qbg4808x66b96v";
      };
    }
    {
      goPackagePath = "github.com/golang/snappy";
      src = fetchFromGitHub {
        owner = "golang";
        repo = "snappy";
        rev = "v0.0.3";
        sha256 = "1dc8sdca0nrqb8wri91mi2xcjm16wyawm4y0fwc5gp24ahjbrg7g";
      };
    }
    {
      goPackagePath = "github.com/steakknife/bloomfilter";
      src = fetchFromGitHub {
        owner = "steakknife";
        repo = "bloomfilter";
        rev = "6819c0d2a57025e1700378ee59b7382d71987f14";
        sha256 = "1dr4pb172rwi9cxvxl23j4j8q6ybqjfzll5dd14cd398f231nk81";
      };
    }
    {
      goPackagePath = "github.com/steakknife/hamming";
      src = fetchFromGitHub {
        owner = "steakknife";
        repo = "hamming";
        rev = "0.2.5";
        sha256 = "1z6kpqfywhqzh9ayzyry5bh6qr08c6yagb20p1py5299h87iawjw";
      };
    }

    {
      goPackagePath = "github.com/deckarep/golang-set";
      src = fetchFromGitHub {
        owner = "deckarep";
        repo = "golang-set";
        rev = "v1.7.1";
        sha256 = "0y64c0p6a7ww5jp6adm6fm97vsni86njw8wkwxfmciy466vhl0lf";
      };
    }
    {
      goPackagePath = "github.com/golang/protobuf";
      src = fetchFromGitHub {
        owner = "golang";
        repo = "protobuf";
        rev = "v1.5.2";
        sha256 = "1mh5fyim42dn821nsd3afnmgscrzzhn3h8rag635d2jnr23r1zhk";
      };
    }
    {
      goPackagePath = "github.com/karalabe/usb";
      src = fetchFromGitHub {
        owner = "karalabe";
        repo = "usb";
        rev = "911d15fe12a9c411cf5d0dd5635231c759399bed";
        sha256 = "0asd5fz2rhzkjmd8wjgmla5qmqyz4jaa6qf0n2ycia16jsck6wc2";
      };
    }
    {
      goPackagePath = "github.com/pborman/uuid";
      src = fetchFromGitHub {
        owner = "pborman";
        repo = "uuid";
        rev = "v1.2.1";
        sha256 = "0n1ng6396zgm1iggzp43h554wwp32iwr62qqfy0zl4jnk2dg41lv";
      };
    }
    {
      goPackagePath = "github.com/google/uuid";
      src = fetchFromGitHub {
        owner = "google";
        repo = "uuid";
        rev = "v1.2.0";
        sha256 = "08wqig98w23cg2ngjijhgm6s0mdayb95awa3cn3bs69lg20gryac";
      };
    }
    {
      goPackagePath = "github.com/rjeczalik/notify";
      src = fetchFromGitHub {
        owner = "rjeczalik";
        repo = "notify";
        rev = "v0.9.2";
        sha256 = "0pq191pvd4icp84sg0513pf5v7xm4nmldaagjd4p8ws75l656grw";
      };
    }

    {
      goPackagePath = "github.com/protocolbuffers/protobuf-go";
      src = fetchFromGitHub {
        owner = "protocolbuffers";
        repo = "protobuf-go";
        rev = "v1.26.0";
        sha256 = "0xq6phaps6d0vcv13ga59gzj4306l0ki9kikhmb52h6pq0iwfqlz";
      };
    }

    {
      goPackagePath = "google.golang.org/protobuf";
      src = fetchgit {
        url = "https://go.googlesource.com/protobuf";
        rev = "v1.26.0";
        sha256 = "0xq6phaps6d0vcv13ga59gzj4306l0ki9kikhmb52h6pq0iwfqlz";
      };
    }
     {
      goPackagePath = "github.com/golang/crypto";
      src = fetchFromGitHub {
        owner = "golang";
        repo = "crypto";
        rev = "83a5a9bb288b4c9523e182ed4f621411a11de3df";
        sha256 = "0ylbifzkcxfag5xq7dznj7s7np6x1qnyg88rnr76zh0s50lca87z";
      };
    } 
    {
      goPackagePath = "gopkg.in/urfave/cli.v1";
      src = fetchFromGitHub {
        owner = "urfave";
        repo = "cli";
        rev = "v1.19.1";
        sha256 = "1ny63c7bfwfrsp7vfkvb4i0xhq4v7yxqnwxa52y4xlfxs4r6v6fg";
      };
    }
    {
      goPackagePath = "golang.org/x/crypto";
      src = fetchgit {
        url = "https://go.googlesource.com/crypto";
        rev = "75b288015ac94e66e3d6715fb68a9b41bf046ec2";
        sha256 = "18vlncvvs11ds3zaaziqjlg5s2vcwi3496nn6qv7p0dp94j5pwa2";
      };
    }
    {
      goPackagePath = "golang.org/x/sys";
      src = fetchgit {
        url = "https://go.googlesource.com/sys";
        rev = "53aa286056ef226755cd898109dbcdaba8ac0b81";
        sha256 = "1yd17ccklby099cpdcsgx6lf0lj968hsnppp16mwh9009ldf72r1";
      };
    }
  ];

  meta = with stdenv.lib; {
    homepage = http://github.com/dapphub/dapptools;
    description = "Make raw signed Ethereum transactions";
    license = [licenses.agpl3];
  };
}
