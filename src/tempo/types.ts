export type TempoWorkLog = {
  // attributes: {
  //   _Mileage_: { value: "15" };
  //   _Team_: { value: "6" };
  //   _Billingkey_: { value: "201433" };
  // };
  worker: string;
  comment: string; //"Import from Tempo API";
  started: string; //"2018-11-01T09:00:00.000";
  timeSpentSeconds: number; // 7200;
  originTaskId: string; // "12690";
};
