// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";

bytes32 constant _tableId = bytes32(abi.encodePacked(bytes16(""), bytes16("ChamberMetadata")));
bytes32 constant ChamberMetadataTableId = _tableId;

struct ChamberMetadataData {
  string metadata;
  string url;
}

library ChamberMetadata {
  /** Get the table's schema */
  function getSchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](2);
    _schema[0] = SchemaType.STRING;
    _schema[1] = SchemaType.STRING;

    return SchemaLib.encode(_schema);
  }

  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _schema = new SchemaType[](1);
    _schema[0] = SchemaType.UINT256;

    return SchemaLib.encode(_schema);
  }

  /** Get the table's metadata */
  function getMetadata() internal pure returns (string memory, string[] memory) {
    string[] memory _fieldNames = new string[](2);
    _fieldNames[0] = "metadata";
    _fieldNames[1] = "url";
    return ("ChamberMetadata", _fieldNames);
  }

  /** Register the table's schema */
  function registerSchema() internal {
    StoreSwitch.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Register the table's schema (using the specified store) */
  function registerSchema(IStore _store) internal {
    _store.registerSchema(_tableId, getSchema(), getKeySchema());
  }

  /** Set the table's metadata */
  function setMetadata() internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    StoreSwitch.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Set the table's metadata (using the specified store) */
  function setMetadata(IStore _store) internal {
    (string memory _tableName, string[] memory _fieldNames) = getMetadata();
    _store.setMetadata(_tableId, _tableName, _fieldNames);
  }

  /** Get metadata */
  function getMetadata(uint256 coord) internal view returns (string memory metadata) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /** Get metadata (using the specified store) */
  function getMetadata(IStore _store, uint256 coord) internal view returns (string memory metadata) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 0);
    return (string(_blob));
  }

  /** Set metadata */
  function setMetadata(uint256 coord, string memory metadata) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.setField(_tableId, _keyTuple, 0, bytes((metadata)));
  }

  /** Set metadata (using the specified store) */
  function setMetadata(IStore _store, uint256 coord, string memory metadata) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.setField(_tableId, _keyTuple, 0, bytes((metadata)));
  }

  /** Get the length of metadata */
  function lengthMetadata(uint256 coord) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of metadata (using the specified store) */
  function lengthMetadata(IStore _store, uint256 coord) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 0, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of metadata (unchecked, returns invalid data if index overflows) */
  function getItemMetadata(uint256 coord, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of metadata (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemMetadata(IStore _store, uint256 coord, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 0, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to metadata */
  function pushMetadata(uint256 coord, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.pushToField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /** Push a slice to metadata (using the specified store) */
  function pushMetadata(IStore _store, uint256 coord, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.pushToField(_tableId, _keyTuple, 0, bytes((_slice)));
  }

  /** Pop a slice from metadata */
  function popMetadata(uint256 coord) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.popFromField(_tableId, _keyTuple, 0, 1);
  }

  /** Pop a slice from metadata (using the specified store) */
  function popMetadata(IStore _store, uint256 coord) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.popFromField(_tableId, _keyTuple, 0, 1);
  }

  /** Update a slice of metadata at `_index` */
  function updateMetadata(uint256 coord, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.updateInField(_tableId, _keyTuple, 0, _index * 1, bytes((_slice)));
  }

  /** Update a slice of metadata (using the specified store) at `_index` */
  function updateMetadata(IStore _store, uint256 coord, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.updateInField(_tableId, _keyTuple, 0, _index * 1, bytes((_slice)));
  }

  /** Get url */
  function getUrl(uint256 coord) internal view returns (string memory url) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = StoreSwitch.getField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /** Get url (using the specified store) */
  function getUrl(IStore _store, uint256 coord) internal view returns (string memory url) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = _store.getField(_tableId, _keyTuple, 1);
    return (string(_blob));
  }

  /** Set url */
  function setUrl(uint256 coord, string memory url) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.setField(_tableId, _keyTuple, 1, bytes((url)));
  }

  /** Set url (using the specified store) */
  function setUrl(IStore _store, uint256 coord, string memory url) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.setField(_tableId, _keyTuple, 1, bytes((url)));
  }

  /** Get the length of url */
  function lengthUrl(uint256 coord) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    uint256 _byteLength = StoreSwitch.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 1;
  }

  /** Get the length of url (using the specified store) */
  function lengthUrl(IStore _store, uint256 coord) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    uint256 _byteLength = _store.getFieldLength(_tableId, _keyTuple, 1, getSchema());
    return _byteLength / 1;
  }

  /** Get an item of url (unchecked, returns invalid data if index overflows) */
  function getItemUrl(uint256 coord, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = StoreSwitch.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Get an item of url (using the specified store) (unchecked, returns invalid data if index overflows) */
  function getItemUrl(IStore _store, uint256 coord, uint256 _index) internal view returns (string memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = _store.getFieldSlice(_tableId, _keyTuple, 1, getSchema(), _index * 1, (_index + 1) * 1);
    return (string(_blob));
  }

  /** Push a slice to url */
  function pushUrl(uint256 coord, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.pushToField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /** Push a slice to url (using the specified store) */
  function pushUrl(IStore _store, uint256 coord, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.pushToField(_tableId, _keyTuple, 1, bytes((_slice)));
  }

  /** Pop a slice from url */
  function popUrl(uint256 coord) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.popFromField(_tableId, _keyTuple, 1, 1);
  }

  /** Pop a slice from url (using the specified store) */
  function popUrl(IStore _store, uint256 coord) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.popFromField(_tableId, _keyTuple, 1, 1);
  }

  /** Update a slice of url at `_index` */
  function updateUrl(uint256 coord, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.updateInField(_tableId, _keyTuple, 1, _index * 1, bytes((_slice)));
  }

  /** Update a slice of url (using the specified store) at `_index` */
  function updateUrl(IStore _store, uint256 coord, uint256 _index, string memory _slice) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.updateInField(_tableId, _keyTuple, 1, _index * 1, bytes((_slice)));
  }

  /** Get the full data */
  function get(uint256 coord) internal view returns (ChamberMetadataData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = StoreSwitch.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Get the full data (using the specified store) */
  function get(IStore _store, uint256 coord) internal view returns (ChamberMetadataData memory _table) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    bytes memory _blob = _store.getRecord(_tableId, _keyTuple, getSchema());
    return decode(_blob);
  }

  /** Set the full data using individual values */
  function set(uint256 coord, string memory metadata, string memory url) internal {
    bytes memory _data = encode(metadata, url);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using individual values (using the specified store) */
  function set(IStore _store, uint256 coord, string memory metadata, string memory url) internal {
    bytes memory _data = encode(metadata, url);

    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.setRecord(_tableId, _keyTuple, _data);
  }

  /** Set the full data using the data struct */
  function set(uint256 coord, ChamberMetadataData memory _table) internal {
    set(coord, _table.metadata, _table.url);
  }

  /** Set the full data using the data struct (using the specified store) */
  function set(IStore _store, uint256 coord, ChamberMetadataData memory _table) internal {
    set(_store, coord, _table.metadata, _table.url);
  }

  /** Decode the tightly packed blob using this table's schema */
  function decode(bytes memory _blob) internal view returns (ChamberMetadataData memory _table) {
    // 0 is the total byte length of static data
    PackedCounter _encodedLengths = PackedCounter.wrap(Bytes.slice32(_blob, 0));

    // Store trims the blob if dynamic fields are all empty
    if (_blob.length > 0) {
      uint256 _start;
      // skip static data length + dynamic lengths word
      uint256 _end = 32;

      _start = _end;
      _end += _encodedLengths.atIndex(0);
      _table.metadata = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));

      _start = _end;
      _end += _encodedLengths.atIndex(1);
      _table.url = (string(SliceLib.getSubslice(_blob, _start, _end).toBytes()));
    }
  }

  /** Tightly pack full data using this table's schema */
  function encode(string memory metadata, string memory url) internal view returns (bytes memory) {
    uint40[] memory _counters = new uint40[](2);
    _counters[0] = uint40(bytes(metadata).length);
    _counters[1] = uint40(bytes(url).length);
    PackedCounter _encodedLengths = PackedCounterLib.pack(_counters);

    return abi.encodePacked(_encodedLengths.unwrap(), bytes((metadata)), bytes((url)));
  }

  /** Encode keys as a bytes32 array using this table's schema */
  function encodeKeyTuple(uint256 coord) internal pure returns (bytes32[] memory _keyTuple) {
    _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));
  }

  /* Delete all data for given keys */
  function deleteRecord(uint256 coord) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /* Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, uint256 coord) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = bytes32(uint256(coord));

    _store.deleteRecord(_tableId, _keyTuple);
  }
}
