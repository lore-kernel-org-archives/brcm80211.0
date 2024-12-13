Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78DF1E411D
	for <brcm80211@lists.linux.dev>; Fri, 13 Dec 2024 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734111349; cv=none; b=GobsATe/afT/57hxaYCmW4MpykQi/bB94/ZUSv8cvxdbun+0vQnyg6PQC0YZkNqr3R+ivg6GU3od0kSx3TgD2WXJVsHY4Kw2gVnwq4KXDvGSXQcLvC2IFNjrDX5G4LzcZhiFllAUYoZHPT3O7APGSd0nfsCAgEoI04AAARS/piA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734111349; c=relaxed/simple;
	bh=DU8KbLI4lQ29g8/nTq/nUIHC4mdflh/TblSy49orax0=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=bpZNHXz5y8i7/JTUUjpgTXZgUxbxcbUGHmCNEHg1tFb2yDr8QLJxs+U5lNFzF+qPC7A7HHiSCnaxofheK4bMoy254+iRJSCuEmuijpjtyuDkO/eHwPZylOiBBH/L8cPkwAMNQphf0CM5HjoBzRbt6dd00RfjRtwIVe2h8HBg80Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dQfWUVBT; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dQfWUVBT"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so3227143a12.1
        for <brcm80211@lists.linux.dev>; Fri, 13 Dec 2024 09:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734111346; x=1734716146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWHTl3C8sYGW2scMn8afLOu/tUGbLkPUKOl5pyz0DTU=;
        b=dQfWUVBTa/VkrCVe7Qxdg2WxBnYoyBiVkLcbapx7MirnLWLvzOgyGXUWAMUxFEioXr
         xa+TbxXbSlBUqN0nfBCs4ph1Jio33xZiTdPbFzFlLhUmFTciSR9OAXz3l9GesaxTAJhF
         2UUyDC6AVHMMt65pvo9KDrpO8Fs1Lpm0dwhaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734111346; x=1734716146;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UWHTl3C8sYGW2scMn8afLOu/tUGbLkPUKOl5pyz0DTU=;
        b=cCGCqDnQ9mTtRg0egZdAeJIkSh7T5LnVMl6Q5hSsTzNScnnEqHOWrOE4iD0dKCOc2X
         p/7NsxhDuO4/XsXp8hZmVmIdugVdSZi/9JU2HcUjKVlrSn7zrJsVCaq/a13b+hqkp0fl
         15GhQUrJTk9AYw3Ka5DwOis/Oa3vL8cVgF5zihHFpKK8nlJvTmMFd5DTsqnMPED3BJDE
         Z7YxduxxhCc4JispcGqYquDeJHbe4XSfFtGCZYBxInYPgsT3y7w1Qh7cV3t/oLLluJwM
         L63mSgeP/UTismsN+49dxgd0Zi122Jsqcay/aHpn0SAMMDn1/qG4PiDec7+nAe1FVP5E
         xvCw==
X-Gm-Message-State: AOJu0YxhaqP/8BGbfvtZWr+niGfV8j3UpZUWK++ZvuiBQj1qvxiIXs5f
	Pvy56ckb9jR9xtPZjqquHwt95+3bO4bNYpz8Os93jvf/47+OUNkCTP87kT7lhA==
X-Gm-Gg: ASbGncvxFfhShBUCpfWOQa5h0N3XlHQuit+qDcyfA1tZic08DQUO3fMSBzumv+5XwW6
	5Lbg0K4KC4yLAOqCMGprOhH0eSfmRN5ZVnxJmD4NW5HhxKChce737ANdc6y+nUavv2BRV2Uibrc
	HabsRnctNdz7K0++0BHUljaUPzS8xxep4pGustJp030zsq95L0U82Bix/240oQa6tAHMYOobBn0
	RF0TDGRoc3RE5L2zVAOLQTOvFjdrm6c69WTTnnXUrDaWtkUqbOwgIV2jWCH4Mdjx0iwTZ/MI5z3
	1Th13LVM0SVZkgaIORg=
X-Google-Smtp-Source: AGHT+IHruhe8dhrCQdSwi/F1O+5xM2ujlYHDewC4LXmg4TvLiCEPlerwRwpbw5mzQ0JdGGs8ypG8Qg==
X-Received: by 2002:a17:907:6d16:b0:aa6:8f71:1645 with SMTP id a640c23a62f3a-aab77ed35abmr382909466b.55.1734111345867;
        Fri, 13 Dec 2024 09:35:45 -0800 (PST)
Received: from [192.168.178.38] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6696acc74sm905743866b.134.2024.12.13.09.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 09:35:45 -0800 (PST)
From: Arend Van Spriel <arend.vanspriel@broadcom.com>
To: KeithG <ys3al35l@gmail.com>
CC: <brcm80211@lists.linux.dev>, <linux-wireless@vger.kernel.org>, Denis Kenzior <denkenz@gmail.com>
Date: Fri, 13 Dec 2024 18:35:45 +0100
Message-ID: <193c1173968.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <CAG17S_PrigpkFP=5wcTL9UETwc6aHqXnuTEyeRrZ7Ey1cb-ZLw@mail.gmail.com>
References: <CAG17S_OwtNxetb7XzsxkZcygH_CWkZx15evQZkThb3WjqpiKTQ@mail.gmail.com>
 <CAG17S_M9wxMsSNyqAQv2oxaCQZ9CAe=GHNjZCbw__2bsAg1hdg@mail.gmail.com>
 <ff9c1192-42b5-4a28-a8c9-31af9765cbff@broadcom.com>
 <CAG17S_PrigpkFP=5wcTL9UETwc6aHqXnuTEyeRrZ7Ey1cb-ZLw@mail.gmail.com>
User-Agent: AquaMail/1.54.0 (build: 105400535)
Subject: Re: brcmfmac SAE/WPA3 negotiation
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On December 13, 2024 4:13:17 PM KeithG <ys3al35l@gmail.com> wrote:

> On Thu, Dec 12, 2024 at 2:17 PM Arend van Spriel
> <arend.vanspriel@broadcom.com> wrote:
>>
>> On 12/12/2024 3:24 PM, KeithG wrote:
>>> Based on a hunch that brcmfmac dbug might reveal something, I turned
>>> it on to see what turned up. I attempted the same as before: using iwd
>>> to connect to the WPA3 AP.
>>>
>>> [iwd]# station wlan0 connect deskSAE
>>> Type the network passphrase for deskSAE psk.
>>> Passphrase: *********
>>> [iwd]# station wlan0 show
>>>                            Station: wlan0
>>> --------------------------------------------------------------------------------
>>> Settable  Property              Value
>>> --------------------------------------------------------------------------------
>>>       Scanning              no
>>>       State                 connecting
>>>       Connected network     deskSAE
>>>       IPv4 address          169.254.203.147
>>>
>>> the attached log shows brcmfmac debug
>>>
>>> it always shows 'State connecting' never connected.
>>>
>>> Is one of these what is causing it to error out:
>>> Dec 09 18:11:06 jackrune kernel: brcmfmac: brcmf_fil_cmd_data Firmware
>>> error: BCME_UNSUPPORTED (-23)
>>> Dec 09 18:11:06 jackrune kernel: brcmfmac: brcmf_fil_iovar_data_get
>>> ifidx=0, name=tdls_sta_info, len=296, err=-52
>>> ...
>>> Dec 09 18:11:06 jackrune kernel: brcmfmac: brcmf_fil_cmd_data Firmware
>>> error: BCME_BADADDR (-21)
>>> Dec 09 18:11:06 jackrune kernel: brcmfmac: brcmf_fil_iovar_data_get
>>> ifidx=0, name=sta_info, len=296, err=-52
>>> ...
>>> Dec 09 18:33:32 jackrune kernel: ieee80211 phy0:
>>> brcmf_cfg80211_get_station: GET STA INFO failed, -52
>>>
>>> I do not know what BCME is.
>>
>> BCME are the error codes produced by the firmware. Without debug prints
>> you will only see a generic error code, ie. -52 (-EBADE). So you always
>> see the "Firmware error" message following by the "generic" error
>> message. It is not truly generic as it mentions the command name. So the
>> above says the command "tdls_sta_info" is unsupported and the mac
>> address provided in the "sta_info" command is not found in firmware.
>>
>> Looking at the log I see periodically:
>>
>> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_fil_cmd_data Firmware
>> error: BCME_NOTASSOCIATED (-17)
>> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_fil_cmd_data_get
>> ifidx=0, cmd=23, len=6, err=-52
>>
>> According fwil.h the driver sends BRCMF_C_GET_BSSID command. When
>> associated is returns the BSSID of your AP. As you are not yet
>> associated it fails. Not really related to the external auth procedure I
>> think.
>>
>> The following is more interesting:
>>
>> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_cfg80211_external_auth
>> Enter
>> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_fil_iovar_data_set
>> ifidx=0, name=auth_status, len=44
>> Dec 09 18:32:55 jackrune kernel: brcmutil: data
>> Dec 09 18:32:55 jackrune kernel: 00000000: 04 00 d8 3a dd 60 a3 0c 07 00
>> 00 00 64 65 73 6b  ...:.`......desk
>> Dec 09 18:32:55 jackrune kernel: 00000010: 53 41 45 00 00 00 00 00 00 00
>> 00 00 00 00 00 00  SAE.............
>> Dec 09 18:32:55 jackrune kernel: 00000020: 00 00 00 00 00 00 00 00 00 00
>> 00 00              ............
>> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_sdio_bus_txctl Enter
>> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_sdio_bus_rxctl Enter
>> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_sdio_isr Enter
>> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_sdio_bus_rxctl resumed
>> on rxctl frame, got 72 expected 72
>> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_fil_cmd_data Firmware
>> error: BCME_BADLEN (-24)
>> Dec 09 18:32:55 jackrune kernel: ieee80211 phy0:
>> brcmf_cfg80211_external_auth: auth_status iovar failed: ret=-52
>>
>> So the "auth_status" command fails and the firmware error code indicates
>> the length is invalid. The length of the "auth_status" command as sent
>> by the driver to the device is 44 and apparently the firmware expects
>> some other length. Here is what I did in my patch:
>>
>> +static int
>> +brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
>> +                       struct cfg80211_external_auth_params *params)
>> +{
>> +       struct brcmf_if *ifp;
>> +       struct brcmf_pub *drvr;
>> +       struct brcmf_auth_req_status_le auth_status;
>> +       int ret = 0;
>> +
>> +       brcmf_dbg(TRACE, "Enter\n");
>> +
>> +       ifp = netdev_priv(dev);
>> +       drvr = ifp->drvr;
>> +       if (params->status == WLAN_STATUS_SUCCESS) {
>> +               auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_SUCCESS);
>> +       } else {
>> +               bphy_err(drvr, "External authentication failed: status=%d\n",
>> +                        params->status);
>> +               auth_status.flags = cpu_to_le16(BRCMF_EXTAUTH_FAIL);
>> +       }
>> +
>> +       memcpy(auth_status.peer_mac, params->bssid, ETH_ALEN);
>> +       auth_status.ssid_len = cpu_to_le32(min_t(u8, params->ssid.ssid_len,
>> +                                                IEEE80211_MAX_SSID_LEN));
>> +       memcpy(auth_status.ssid, params->ssid.ssid, auth_status.ssid_len);
>> +
>> +       ret = brcmf_fil_iovar_data_set(ifp, "auth_status", &auth_status,
>> +                                      sizeof(auth_status));
>> +       if (ret < 0)
>> +               bphy_err(drvr, "auth_status iovar failed: ret=%d\n", ret);
>> +
>> +       return ret;
>> +}
>>
>> So the type struct brcmf_auth_req_status_le is used for external auth
>> request and for auth_status. Maybe for the "auth_status" it only needs a
>> subset of fields. Here is the struct declaration:
>>
>> +/**
>> + * struct brcmf_auth_req_status_le - external auth request and status
>> update
>> + *
>> + * @flags: flags for external auth status
>> + * @peer_mac: peer MAC address
>> + * @ssid_len: length of ssid
>> + * @ssid: ssid characters
>> + */
>> +struct brcmf_auth_req_status_le {
>> +       __le16 flags;
>> +       u8 peer_mac[ETH_ALEN];
>> +       __le32 ssid_len;
>> +       u8 ssid[IEEE80211_MAX_SSID_LEN];
>> +};
>>
>> Maybe flags and peer_mac is sufficient? That would be 8 bytes so can you
>> try and change brcmf_cyw_external_auth() such that it does:
>>
>> +       ret = brcmf_fil_iovar_data_set(ifp, "auth_status", &auth_status, 8);
>>
>> Without firmware source code we can only guess.
>>
>> Regards,
>> Arend
>>
>>> On Mon, Dec 9, 2024 at 8:30 AM KeithG <ys3al35l@gmail.com> wrote:
>>>>
>>>> I poked at this a while back and decided to try it again over the weekend.
>>>>
>>>> Infineon has released a new firmware:
>>>> Firmware: BCM4345/6 wl0: Oct 28 2024 23:27:00 version 7.45.286
>>>> (be70ab3 CY) FWID 01-95efe7fa
>>>> it is not in the RPiOS release, yet, but I installed it on a Pi3B+ and
>>>> decided to give it a try. I have an AP running WPA3 personal on a
>>>> desktop in the home and can connect to it with my phone as proof that
>>>> it 'works'.
>>>>
>>>> I tried to connect to it once again from the Pi while running this new
>>>> firmware. It gets closer than last time I checked, but it does not
>>>> actually negotiate a functional connection.
>>>> I tried with connman/iwd, NetworkManager/iwd and it gets close, but
>>>> still errors out. I get a number of these in the iwmon log:
>>>>
>>>>> Response: Get Station (0x11) len 4                                  38.439787
>>>> Status: Invalid exchange (52)
>>>>
>>>> Can I probe this further to assist in diagnosing the cause and
>>>> potentially help with a solution?
>>>> The log is attached.
>>>>
>>>> Regards,
>>>>
>>>> Keith
> Arend,
>
> Does this iwmon log help at all.

Probably not. The issue seems to be between driver and firmware.

If there is anyone out there that successfully used the ext_auth with 
downstream ifx driver they could create the same log and see what length 
the auth_status command uses.

I'll see what I can find.

Regards,
Arend



