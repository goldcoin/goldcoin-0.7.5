GoldCoin (GLD) - an improved version of Litecoin using scrypt as a proof of work scheme.
 - 2.5 minute block targets up till block 40000
 - 2 minute block targets there after
 - 504 blocks per difficulty retarget up to block 40000
 - 60 blocks per difficulty retarget thereafter

Block rewards in order:

 - 200 Block @ 10000 GLD
 - 2000	Blocks @ 1000 GLD
 - 37800 Blocks @ 500 GLD (not final)
 - (The values below are post-fork in development/dispute values)
 - The Block reward drops to 45 GLD (not final)
 - Reward for the years thereafter is divided by (1.1 + 0.49*every year after fork)
 - Total Blocks: 26,325,000 (not final)
 - Total Coins Produced: 119,124,000 (not final)
 - The default ports are 8121 (connect) and 8122 (fson rpc)

Notice the block fork number showed in this release is not necessarily the correct one.

If you wish to use this code anyways, be sure to increase the blockFork number accordingly to a very large
value until the fork is actually announced. Otherwise you may run into problems.

The client will act and function the same way as the old client did then (with a few improvements :D )

Don't say we didn't warn you :) (PS. Its the variable julyFork in the main.h file)


Development process
===================

Developers work in their own trees, then submit pull requests when
they think their feature or bug fix is ready.

The patch will be accepted if there is broad consensus that it is a
good thing.  Developers should expect to rework and resubmit patches
if they don't match the project's coding conventions (see coding.txt)
or are controversial.

The master branch is regularly built and tested, but is not guaranteed
to be completely stable. Tags are regularly created to indicate new
official, stable release versions of Goldcoin.

Feature branches are created when there are major new features being
worked on by several people.

From time to time a pull request will become outdated. If this occurs, and
the pull is no longer automatically mergeable; a comment on the pull will
be used to issue a warning of closure. The pull will be closed 15 days
after the warning if action is not taken by the author. Pull requests closed
in this manner will have their corresponding issue labeled 'stagnant'.

Issues with no commits will be given a similar warning, and closed after
15 days from their last activity. Issues closed in this manner will be 
labeled 'stale'. 

Check out http://gldcoin.com for more info about the development.

Development Team
================
- akumaburn
- Stouse49

Consultants
================
- Sting17
- Microguy
- AZIZ1977

