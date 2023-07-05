// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

interface IAgentSystem {
  function setAgent(
    uint256 coord,
    uint256 seed,
    uint32 tokenId,
    uint8 yonder,
    uint8 terrain,
    uint8 gemType,
    uint16 coins,
    uint16 worth,
    int32 gridX,
    int32 gridY
  ) external;

  function setAgentMetadata(bytes32 key, string memory metadata) external;

  function setAgentArtUrl(bytes32 key, string memory url) external;
}
