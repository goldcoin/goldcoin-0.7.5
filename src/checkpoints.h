// Copyright (c) 2009-2012 The Bitcoin developers
// Copyright (c) 2011-2012 Litecoin Developers
// Copyright (c) 2013 GoldCoin (GLD) Developers
// Distributed under the MIT/X11 software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.
#ifndef BITCOIN_CHECKPOINT_H
#define  BITCOIN_CHECKPOINT_H

#include <map>

class uint256;
class CBlockIndex;

/** Block-chain checkpoints are compiled-in sanity checks.
 * They are updated every release or three.
 */
namespace Checkpoints
{
// Add a bad block (only in memory!)
void addBadBlock(uint256 hash);

// Remove a bad block (only in memory!)
void removeBadBlock(uint256 hash);

// Returns true if block fails bad checkpoint checks
bool CheckBadBlock(const uint256& hash);

// Returns true if block passes checkpoint checks
bool CheckBlock(int nHeight, const uint256& hash);

// Return conservative estimate of total number of blocks, 0 if unknown
int GetTotalBlocksEstimate();

// Add a checkpoint (only in memory!)
void addCheckpoint(int nHeight, uint256 hash);

// Remove a checkpoint (only in memory!)
void removeCheckpoint(int nHeight);

// Returns last CBlockIndex* in mapBlockIndex that is a checkpoint
CBlockIndex* GetLastCheckpoint(const std::map<uint256, CBlockIndex*>& mapBlockIndex);


}

#endif
