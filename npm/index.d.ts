declare module '@apiverve/institutionalholdings' {
  export interface institutionalholdingsOptions {
    api_key: string;
    secure?: boolean;
  }

  /**
   * Describes fields the current plan does not unlock. Locked fields arrive as null
   * in `data`; `locked_fields` names them, using dot paths for nested fields.
   * Absent when the plan unlocks everything.
   */
  export interface PremiumInfo {
    message: string;
    upgrade_url: string;
    locked_fields: string[];
  }

  export interface institutionalholdingsResponse {
    status: string;
    error: string | null;
    data: InstitutionalHoldingsData;
    code?: number;
    premium?: PremiumInfo;
  }


  interface InstitutionalHoldingsData {
      mode:           null | string;
      period:         Date | null;
      quarter:        null | string;
      previousPeriod: Date | null;
      manager:        Manager;
      filing:         Filing;
      totalValue:     number | null;
      positionCount:  number | null;
      count:          number | null;
      offset:         number | null;
      totalMatches:   number | null;
      holdings:       Holding[];
  }
  
  interface Filing {
      formType:        null | string;
      accessionNumber: null | string;
      filingDate:      Date | null;
      amendments:      number | null;
      url:             null | string;
  }
  
  interface Holding {
      issuer:               null | string;
      ticker:               null | string;
      cusip:                null | string;
      figi:                 null | string;
      titleOfClass:         null | string;
      shares:               number | null;
      shareType:            null | string;
      value:                number | null;
      portfolioPercent:     number | null;
      putCall:              null;
      investmentDiscretion: null | string;
      votingAuthority:      VotingAuthority;
      previousShares:       number | null;
      previousValue:        number | null;
      shareChange:          number | null;
      shareChangePercent:   number | null;
      valueChange:          number | null;
      changeType:           null | string;
      isNew:                boolean | null;
  }
  
  interface VotingAuthority {
      sole:   number | null;
      shared: number | null;
      none:   number | null;
  }
  
  interface Manager {
      cik:   null | string;
      name:  null | string;
      city:  null | string;
      state: null | string;
  }

  export default class institutionalholdingsWrapper {
    constructor(options: institutionalholdingsOptions);

    execute(callback: (error: any, data: institutionalholdingsResponse | null) => void): Promise<institutionalholdingsResponse>;
    execute(query: Record<string, any>, callback: (error: any, data: institutionalholdingsResponse | null) => void): Promise<institutionalholdingsResponse>;
    execute(query?: Record<string, any>): Promise<institutionalholdingsResponse>;
  }
}
