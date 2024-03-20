local _, addonTable = ...

-- Returns details about which characters and owned guilds contain items
-- matching the item link.
--   itemLink: string
--   sameConnectedRealms: boolean
--   sameCurrentFaction: boolean
function Syndicator.API.GetInventoryInfo(itemLink, sameConnectedRealm, sameFaction)
  local success, key = pcall(Syndicator.Utilities.GetItemKey, itemLink)
  if not success then
    error("Bad item link. Try using one generated by a call to GetItemInfo.")
    return
  end

  return Syndicator.ItemSummaries:GetTooltipInfo(key, sameConnectedRealm == true, sameFaction == true)
end

-- Returns currency counts for a specific currency on all characters
--   currencyID: number
--   sameConnectedRealms: boolean
--   sameCurrentFaction: boolean
function Syndicator.API.GetCurrencyInfo(currencyID, sameConnectedRealm, sameFaction)
  assert(type(currencyID) == "number")
  return Syndicator.Tracking.GetCurrencyTooltipData(currencyID, sameConnectedRealm == true, sameFaction == true)
end

-- Set the callback used when an item's location is clicked in the /syns search results
-- callback: function(mode, entity, container, itemLink, searchText)
--    mode: "character" or "guild"
--    entity: Name of character or guild
--    container: "bag", "bank" or guild bank tab (number)
--    itemLink: Item Link for the item who's owner has been clicked on
--    searchText: Search text to help focus the item
function Syndicator.API.RegisterShowItemLocation(callback)
  addonTable.ShowItemLocationCallback = callback
end
