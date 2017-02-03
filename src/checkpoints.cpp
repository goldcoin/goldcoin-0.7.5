// Copyright (c) 2009-2012 The Bitcoin developers
// Copyright (c) 2011-2012 Litecoin Developers
// Copyright (c) 2013 GoldCoin (GLD) Developers

// Distributed under the MIT/X11 software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#include <boost/assign/list_of.hpp> // for 'map_list_of()'
#include <boost/foreach.hpp>

#include "checkpoints.h"
#include "main.h"
#include "uint256.h"
#include <string.h>

namespace Checkpoints
{
typedef std::map<int, uint256> MapCheckpoints;
//
// What makes a good checkpoint block?
// + Is surrounded by blocks with reasonable timestamps
//   (no blocks before with a timestamp after, none after with
//    timestamp before)
// + Contains no strange transactions
//
static MapCheckpoints mapCheckpoints =
    boost::assign::map_list_of
    (     0, uint256("0xdced3542896ed537cb06f9cb064319adb0da615f64dd8c5e5bad974398f44b24"))
    (     1, uint256("0xe39be079a4e57af79f63edb2726bdcb401ae520fa5b5328bbeab185b5b3d636e"))
    (     50, uint256("0x34b021706ae2b72e41d411a31ead78219087213a29fe338515926f055a4c5655"))
    (     150, uint256("0xc3565831a172cf737b0dd8bd47a81f2dfe99012c97362f397838e617d26ba99b"))
    (     300, uint256("0x52d9e6919828769b358db66f8793a06e5915948d0a0ee36f59465e91dabb97a6"))
    (     500, uint256("0x6ba9043e14339790c56181da3ef4d87ff58b8cd3c07b2d33e7d808e189136002"))
    (     1000, uint256("0x29607502895cf180b7b556f0bc70b2001eacb819be6b4be1e5f0092622e03cb3"))
    (     6048, uint256("0xe8eb14ac03f25fd52a46b51acba8af543f6b4baf1b85b62d6e6e09ba5f108ed7"))
    (     12096, uint256("0xd2bd87d677cced55584634d6d03434e041d5dbbaf5639c873a5f6a654d788ad1"))
    (     16128, uint256("0x290d05c1f5fb2cc75d5bc7657141e4e42d4ee7b4e78a73c96fac878a58d52057"))
    (     18143, uint256("0x996caca04cce6ffc7f1053abcd350742e2ecc3220663cfd3e3585e3442d7cf74"))
    (     18144, uint256("0xed5124e191b92d5405374dc4018203a7e03f4251293b6d5f57a83d1e1ff4df30"))
    (     20160, uint256("0xe19b119f4a633d89320d502e7c05b88d083acdff3b4bd40efcdca54b25f6cb2c"))
    (     20500, uint256("0x23ab64ad71d7191c28010c7c1b0b35d32ac97ace893dbb20068a6abb617f80a4"))
    (     24000, uint256("0xc3cf2892cbaaf8b88565f027460bda831a428bf6ea76fafa870bf3586dd07c5f"))
    (     27000, uint256("0xf7391f58e29d057f152b9c124af6153dadb62385d8728118e9cef728d9a4d16d"))
    (     28000, uint256("0x28adf712f2a7d9d7ab3836249c9e2beff8d0deb362a1991c61cb61c0fe9af10b"))
    (     29000, uint256("0x0aca7e1d7cebe224479db62d9887bba7e8dbf5cc295261b6b2e9b9bc76f58ab1"))
    (     30000, uint256("0x1ff80eac17ba7efc350d65d842cbedd5822b4bef3eae7b1c24424c0d5cc2af51"))
    (     31000, uint256("0xe9a24595526e9c67357e3a5962e8d489a867573eef1ea104de6be113d26512de"))
    (     35000, uint256("0x0d8f14bc84ed93490b8c2070de4b744085a4d661f7ef96c856fd32572bbd87fc"))
    (     45000, uint256("0x612461aaa0ca6a3bc07238ac86e67fa37ae1b8b083d0c1e23f396bbe5bd05896"))
    (     50000, uint256("0xe251895683ec1363344504b91d9899c29064afc786905c9a052d61ee88a95206"))
    (     60000, uint256("0xf03feaab75843a39be8cf0fbf8bdae3056aebd4817b89a99e4837db2bdd2659a"))
    (     65000, uint256("0xb635ce68527e8b777f68a71fe441faab285fa7aafd78259ddc24843539bba369"))
    (     66000, uint256("0xf619fc8b01c1aedcf4623cea7d85310db85174e27e1b3069dadf76e9bc2f6c99"))
    (     82900, uint256("0xd411f2115353a132b425c498be3e521b6dbabc424259ce9cba822da46cc41ba4"))
    (     86000, uint256("0x5a4fac33aa961451860b15dd8a8adfe5c6a0e0ce3fee503ff5b9e5162f2a7ccf"))
    (     100000, uint256("0x292b50277877a5d7780614f460f669467d09f7d47a84765fb9633c9c78aa035a"))
    (     100989, uint256("0xb0a9b5749a77c6b3f17935fe220c8a76d56003d2f9e2cbd281f5a7315eae5924"))
    (     115300, uint256("0x77b3f1913755a4d381f36cd134f280a6519dd54d1c33c499eeded256f36bb394"))
    (     246100, uint256("0xca7ed43264e0e8965d4115d2f8d3fabb63dcb430fe502d31796c63658ab8274d"))
    (     300000, uint256("0xe81d2c84c9e7332b35788c1166a0b2c9a34be4d17f08f44a9ba2f5edd82dc300"))
    (     372000, uint256("0xe3d2857896d0f52ac502eb056ac23f416cb7eddb0a6eba68785b940cca8257ee"))
    (     564000, uint256("0x9d67ce445d6b513074ef061066bb331871901b953b3bdeaa4dc0a4043cf189f8"))
    ;

static std::list<uint256> badBlockList;


void addBadBlock(uint256 hash)
{
    badBlockList.push_back(hash);
}

void removeBadBlock(uint256 hash)
{
    badBlockList.remove(hash);
}

bool CheckBadBlock(const uint256& hash)
{
    if (fTestNet) return false; // Testnet has no bad blocks

    return std::find(badBlockList.begin(), badBlockList.end(), hash) != badBlockList.end();
}

bool CheckBlock(int nHeight, const uint256& hash)
{
    if (fTestNet) return true; // Testnet has no checkpoints

    MapCheckpoints::const_iterator i = mapCheckpoints.find(nHeight);
    if (i == mapCheckpoints.end()) return true;
    return hash == i->second;
}

int GetTotalBlocksEstimate()
{
    if (fTestNet) return 0;
    return mapCheckpoints.rbegin()->first;
}

void addCheckpoint(int nHeight, uint256 hash)
{
    mapCheckpoints.insert(std::pair<int, uint256>(nHeight, hash));
}

void removeCheckpoint(int nHeight)
{
    mapCheckpoints.erase(mapCheckpoints.find(nHeight));
}

CBlockIndex* GetLastCheckpoint(const std::map<uint256, CBlockIndex*>& mapBlockIndex)
{
    if (fTestNet) return NULL;

    BOOST_REVERSE_FOREACH(const MapCheckpoints::value_type & i, mapCheckpoints)
    {
        const uint256& hash = i.second;
        std::map<uint256, CBlockIndex*>::const_iterator t = mapBlockIndex.find(hash);
        if (t != mapBlockIndex.end())
            return t->second;
    }
    return NULL;
}
}
