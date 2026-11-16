using System;
using System.Collections.Generic;
using System.Text;
using Newtonsoft.Json;

namespace APIVerve.API.InstitutionalHoldings
{
    /// <summary>
    /// Query options for the Institutional Holdings API
    /// </summary>
    public class InstitutionalHoldingsQueryOptions
    {
        /// <summary>
        /// SEC Central Index Key of the 13F filer, e.g. 1067983 for Berkshire Hathaway. Returns that manager's holdings.
        /// </summary>
        [JsonProperty("cik")]
        public string Cik { get; set; }

        /// <summary>
        /// Manager name to search for instead of cik, e.g. bridgewater. The best match is returned, with other close matches in otherMatches.
        /// </summary>
        [JsonProperty("manager")]
        public string Manager { get; set; }

        /// <summary>
        /// Ticker symbol. Alone, lists the managers holding it; with cik or manager, filters that manager's holdings to it.
        /// </summary>
        [JsonProperty("ticker")]
        public string Ticker { get; set; }

        /// <summary>
        /// 9-character CUSIP. Alone, lists the managers holding it; with cik or manager, filters that manager's holdings to it.
        /// </summary>
        [JsonProperty("cusip")]
        public string Cusip { get; set; }

        /// <summary>
        /// Quarter to read, as a quarter end (2026-03-31) or quarter (2026Q1). Defaults to the latest quarter.
        /// </summary>
        [JsonProperty("period")]
        public string Period { get; set; }

        /// <summary>
        /// Only positions that are new, increased, decreased, unchanged or soldout since the previous quarter. Sold-out positions appear only with soldout.
        /// </summary>
        [JsonProperty("changeType")]
        public string ChangeType { get; set; }

        /// <summary>
        /// Option filter: put, call, none (shares and principal only) or all. Defaults to all.
        /// </summary>
        [JsonProperty("putCall")]
        public string PutCall { get; set; }

        /// <summary>
        /// Only positions worth at least this many US dollars.
        /// </summary>
        [JsonProperty("minValue")]
        public double? MinValue { get; set; }

        /// <summary>
        /// Only positions worth at most this many US dollars.
        /// </summary>
        [JsonProperty("maxValue")]
        public double? MaxValue { get; set; }

        /// <summary>
        /// Sort by value (default), shares, change (share change), changepercent or portfolio (weight).
        /// </summary>
        [JsonProperty("sort")]
        public string Sort { get; set; }

        /// <summary>
        /// Sort order: desc (default) or asc.
        /// </summary>
        [JsonProperty("order")]
        public string Order { get; set; }

        /// <summary>
        /// Rows to return (1-100). Defaults to 10.
        /// </summary>
        [JsonProperty("limit")]
        public int? Limit { get; set; }

        /// <summary>
        /// Rows to skip, for paging through a large portfolio or holder list.
        /// </summary>
        [JsonProperty("offset")]
        public int? Offset { get; set; }

        /// <summary>
        /// Add a summary: for a manager, value change, position counts by change type, top-10 concentration and turnover; for a security, holder flows and top-10 share concentration.
        /// </summary>
        [JsonProperty("summary")]
        public bool? Summary { get; set; }
    }
}
