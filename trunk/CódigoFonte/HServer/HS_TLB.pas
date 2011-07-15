unit HS_TLB;

// ************************************************************************ //
// WARNING                                                                    
// -------                                                                    
// The types declared in this file were generated from data read from a       
// Type Library. If this type library is explicitly or indirectly (via        
// another type library referring to this type library) re-imported, or the   
// 'Refresh' command of the Type Library Editor activated while editing the   
// Type Library, the contents of this file will be regenerated and all        
// manual modifications will be lost.                                         
// ************************************************************************ //

// PASTLWTR : 1.2
// File generated on 10-Jul-11 3:52:48 PM from Type Library described below.

// ************************************************************************  //
// Type Lib: C:\handel\CódigoFonte\HServer\HS.tlb (1)
// LIBID: {28718E0A-7A17-46B1-83DB-850F8A66B1E2}
// LCID: 0
// Helpfile: 
// HelpString: HS Library
// DepndLst: 
//   (1) v1.0 Midas, (C:\Windows\SysWOW64\midas.dll)
//   (2) v2.0 stdole, (C:\Windows\SysWOW64\stdole2.tlb)
// ************************************************************************ //
{$TYPEDADDRESS OFF} // Unit must be compiled without type-checked pointers. 
{$WARN SYMBOL_PLATFORM OFF}
{$WRITEABLECONST ON}
{$VARPROPSETTER ON}
interface

uses Windows, ActiveX, Classes, Graphics, Midas, StdVCL, Variants;
  

// *********************************************************************//
// GUIDS declared in the TypeLibrary. Following prefixes are used:        
//   Type Libraries     : LIBID_xxxx                                      
//   CoClasses          : CLASS_xxxx                                      
//   DISPInterfaces     : DIID_xxxx                                       
//   Non-DISP interfaces: IID_xxxx                                        
// *********************************************************************//
const
  // TypeLibrary Major and minor versions
  HSMajorVersion = 1;
  HSMinorVersion = 0;

  LIBID_HS: TGUID = '{28718E0A-7A17-46B1-83DB-850F8A66B1E2}';

  IID_IRDM: TGUID = '{1AB67940-3A0C-43A2-A69C-EB84F013E4F0}';
  CLASS_RDM: TGUID = '{29C1310A-D963-42DA-99C6-C0570B487612}';
type

// *********************************************************************//
// Forward declaration of types defined in TypeLibrary                    
// *********************************************************************//
  IRDM = interface;
  IRDMDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library                       
// (NOTE: Here we map each CoClass to its Default Interface)              
// *********************************************************************//
  RDM = IRDM;


// *********************************************************************//
// Interface: IRDM
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1AB67940-3A0C-43A2-A69C-EB84F013E4F0}
// *********************************************************************//
  IRDM = interface(IAppServer)
    ['{1AB67940-3A0C-43A2-A69C-EB84F013E4F0}']
  end;

// *********************************************************************//
// DispIntf:  IRDMDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {1AB67940-3A0C-43A2-A69C-EB84F013E4F0}
// *********************************************************************//
  IRDMDisp = dispinterface
    ['{1AB67940-3A0C-43A2-A69C-EB84F013E4F0}']
    function AS_ApplyUpdates(const ProviderName: WideString; Delta: OleVariant; MaxErrors: Integer; 
                             out ErrorCount: Integer; var OwnerData: OleVariant): OleVariant; dispid 20000000;
    function AS_GetRecords(const ProviderName: WideString; Count: Integer; out RecsOut: Integer; 
                           Options: Integer; const CommandText: WideString; var Params: OleVariant; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000001;
    function AS_DataRequest(const ProviderName: WideString; Data: OleVariant): OleVariant; dispid 20000002;
    function AS_GetProviderNames: OleVariant; dispid 20000003;
    function AS_GetParams(const ProviderName: WideString; var OwnerData: OleVariant): OleVariant; dispid 20000004;
    function AS_RowRequest(const ProviderName: WideString; Row: OleVariant; RequestType: Integer; 
                           var OwnerData: OleVariant): OleVariant; dispid 20000005;
    procedure AS_Execute(const ProviderName: WideString; const CommandText: WideString; 
                         var Params: OleVariant; var OwnerData: OleVariant); dispid 20000006;
  end;

// *********************************************************************//
// The Class CoRDM provides a Create and CreateRemote method to          
// create instances of the default interface IRDM exposed by              
// the CoClass RDM. The functions are intended to be used by             
// clients wishing to automate the CoClass objects exposed by the         
// server of this typelibrary.                                            
// *********************************************************************//
  CoRDM = class
    class function Create: IRDM;
    class function CreateRemote(const MachineName: string): IRDM;
  end;

implementation

uses ComObj;

class function CoRDM.Create: IRDM;
begin
  Result := CreateComObject(CLASS_RDM) as IRDM;
end;

class function CoRDM.CreateRemote(const MachineName: string): IRDM;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_RDM) as IRDM;
end;

end.
