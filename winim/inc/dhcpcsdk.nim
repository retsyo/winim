#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2021 Ward
#
#====================================================================

import winimbase
import windef
#include <dhcpcsdk.h>
type
  DHCPAPI_PARAMS* {.pure.} = object
    Flags*: ULONG
    OptionId*: ULONG
    IsVendor*: WINBOOL
    Data*: LPBYTE
    nBytesData*: DWORD
  PDHCPAPI_PARAMS* = ptr DHCPAPI_PARAMS
  LPDHCPAPI_PARAMS* = ptr DHCPAPI_PARAMS
  DHCPCAPI_PARAMS* = DHCPAPI_PARAMS
  PDHCPCAPI_PARAMS* = ptr DHCPAPI_PARAMS
  LPDHCPCAPI_PARAMS* = ptr DHCPAPI_PARAMS
  DHCPCAPI_PARAMS_ARRAY* {.pure.} = object
    nParams*: ULONG
    Params*: LPDHCPCAPI_PARAMS
  PDHCPCAPI_PARAMS_ARRAY* = ptr DHCPCAPI_PARAMS_ARRAY
  LPDHCPCAPI_PARAMS_ARRAY* = ptr DHCPCAPI_PARAMS_ARRAY
  DHCPCAPI_CLASSID* {.pure.} = object
    Flags*: ULONG
    Data*: LPBYTE
    nBytesData*: ULONG
  PDHCPCAPI_CLASSID* = ptr DHCPCAPI_CLASSID
  LPDHCPCAPI_CLASSID* = ptr DHCPCAPI_CLASSID
const
  OPTION_PAD* = 0
  OPTION_SUBNET_MASK* = 1
  OPTION_TIME_OFFSET* = 2
  OPTION_ROUTER_ADDRESS* = 3
  OPTION_TIME_SERVERS* = 4
  OPTION_IEN116_NAME_SERVERS* = 5
  OPTION_DOMAIN_NAME_SERVERS* = 6
  OPTION_LOG_SERVERS* = 7
  OPTION_COOKIE_SERVERS* = 8
  OPTION_LPR_SERVERS* = 9
  OPTION_IMPRESS_SERVERS* = 10
  OPTION_RLP_SERVERS* = 11
  OPTION_HOST_NAME* = 12
  OPTION_BOOT_FILE_SIZE* = 13
  OPTION_MERIT_DUMP_FILE* = 14
  OPTION_DOMAIN_NAME* = 15
  OPTION_SWAP_SERVER* = 16
  OPTION_ROOT_DISK* = 17
  OPTION_EXTENSIONS_PATH* = 18
  OPTION_BE_A_ROUTER* = 19
  OPTION_NON_LOCAL_SOURCE_ROUTING* = 20
  OPTION_POLICY_FILTER_FOR_NLSR* = 21
  OPTION_MAX_REASSEMBLY_SIZE* = 22
  OPTION_DEFAULT_TTL* = 23
  OPTION_PMTU_AGING_TIMEOUT* = 24
  OPTION_PMTU_PLATEAU_TABLE* = 25
  OPTION_MTU* = 26
  OPTION_ALL_SUBNETS_MTU* = 27
  OPTION_BROADCAST_ADDRESS* = 28
  OPTION_PERFORM_MASK_DISCOVERY* = 29
  OPTION_BE_A_MASK_SUPPLIER* = 30
  OPTION_PERFORM_ROUTER_DISCOVERY* = 31
  OPTION_ROUTER_SOLICITATION_ADDR* = 32
  OPTION_STATIC_ROUTES* = 33
  OPTION_TRAILERS* = 34
  OPTION_ARP_CACHE_TIMEOUT* = 35
  OPTION_ETHERNET_ENCAPSULATION* = 36
  OPTION_TTL* = 37
  OPTION_KEEP_ALIVE_INTERVAL* = 38
  OPTION_KEEP_ALIVE_DATA_SIZE* = 39
  OPTION_NETWORK_INFO_SERVICE_DOM* = 40
  OPTION_NETWORK_INFO_SERVERS* = 41
  OPTION_NETWORK_TIME_SERVERS* = 42
  OPTION_VENDOR_SPEC_INFO* = 43
  OPTION_NETBIOS_NAME_SERVER* = 44
  OPTION_NETBIOS_DATAGRAM_SERVER* = 45
  OPTION_NETBIOS_NODE_TYPE* = 46
  OPTION_NETBIOS_SCOPE_OPTION* = 47
  OPTION_XWINDOW_FONT_SERVER* = 48
  OPTION_XWINDOW_DISPLAY_MANAGER* = 49
  OPTION_REQUESTED_ADDRESS* = 50
  OPTION_LEASE_TIME* = 51
  OPTION_OK_TO_OVERLAY* = 52
  OPTION_MESSAGE_TYPE* = 53
  OPTION_SERVER_IDENTIFIER* = 54
  OPTION_PARAMETER_REQUEST_LIST* = 55
  OPTION_MESSAGE* = 56
  OPTION_MESSAGE_LENGTH* = 57
  OPTION_RENEWAL_TIME* = 58
  OPTION_REBIND_TIME* = 59
  OPTION_CLIENT_CLASS_INFO* = 60
  OPTION_CLIENT_ID* = 61
  OPTION_TFTP_SERVER_NAME* = 66
  OPTION_BOOTFILE_NAME* = 67
  OPTION_END* = 255
  DHCPCAPI_REQUEST_PERSISTENT* = 0x01
  DHCPCAPI_REQUEST_SYNCHRONOUS* = 0x02
  DHCPCAPI_REQUEST_ASYNCHRONOUS* = 0x04
  DHCPCAPI_REQUEST_CANCEL* = 0x08
  DHCPCAPI_REQUEST_MASK* = 0x0F
  DHCPCAPI_REGISTER_HANDLE_EVENT* = 0x01
  DHCPCAPI_DEREGISTER_HANDLE_EVENT* = 0x01
proc DhcpCApiInitialize*(Version: LPDWORD): DWORD {.winapi, stdcall, dynlib: "dhcpcsvc", importc.}
proc DhcpCApiCleanup*(): VOID {.winapi, stdcall, dynlib: "dhcpcsvc", importc.}
proc DhcpRequestParams*(Flags: DWORD, Reserved: LPVOID, AdapterName: LPWSTR, ClassId: LPDHCPCAPI_CLASSID, SendParams: DHCPCAPI_PARAMS_ARRAY, RecdParams: DHCPCAPI_PARAMS_ARRAY, Buffer: LPBYTE, pSize: LPDWORD, RequestIdStr: LPWSTR): DWORD {.winapi, stdcall, dynlib: "dhcpcsvc", importc.}
proc DhcpUndoRequestParams*(Flags: DWORD, Reserved: LPVOID, AdapterName: LPWSTR, RequestIdStr: LPWSTR): DWORD {.winapi, stdcall, dynlib: "dhcpcsvc", importc.}
proc DhcpRegisterParamChange*(Flags: DWORD, Reserved: LPVOID, AdapterName: LPWSTR, ClassId: LPDHCPCAPI_CLASSID, Params: DHCPCAPI_PARAMS_ARRAY, Handle: LPVOID): DWORD {.winapi, stdcall, dynlib: "dhcpcsvc", importc.}
proc DhcpDeRegisterParamChange*(Flags: DWORD, Reserved: LPVOID, Event: LPVOID): DWORD {.winapi, stdcall, dynlib: "dhcpcsvc", importc.}
proc DhcpRemoveDNSRegistrations*(): DWORD {.winapi, stdcall, dynlib: "dhcpcsvc", importc.}
