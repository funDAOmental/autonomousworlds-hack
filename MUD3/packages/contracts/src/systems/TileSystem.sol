// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

import { System } from "@latticexyz/world/src/System.sol";
import { getUniqueEntity } from "@latticexyz/world/src/modules/uniqueentity/getUniqueEntity.sol";
import { Tile, Position, Blocker, Door } from "../codegen/Tables.sol";
import { Crawl } from "../utils/Crawl.sol";

contract TileSystem is System {

  // Bridge setters
  function setTile(
    uint256 coord,
    uint32 tokenId,
    uint8 terrain,
    uint8 tileType,
    int32 gridX,
    int32 gridY,
    bool isEntry,
    int8 doorDir
  ) public {
    bytes32 key = getUniqueEntity();
    Tile.set(key,
      tokenId,
      terrain,
      tileType,
      isEntry
    );
    Position.set(key,
      gridX,
      gridY
    );
    if (tileType == 0 || tileType == 4) { // walls and gems
      Blocker.set(key, true);
    }
    if (doorDir >= 0) {
      Door.set(key,
        Crawl.offsetCoord(coord, Crawl.Dir(doorDir))
      );
    }
  }
}
