Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 789F66FB0
	for <brcm80211@lists.linux.dev>; Sat, 14 Dec 2024 00:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734136857; cv=none; b=TmDvVl+VfbiOrcgXhYQYTo3bdbcs1n7tk0BZJtZRfBEB2lyaghQSGt0UuSE88AAiUnVRXhwW/WfLJQag3cga+S64z1d2uQ/TMXkG6EWW4k4b87EebE2+AqVOqSgLkpcPvTs0oFAoC4fDAa82gvsAiI8ucddgH0JCfXObkpenUw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734136857; c=relaxed/simple;
	bh=JfuxXYBuwfUAATKf9s6inX4UzdIVBbgo1F48bxHhIfM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X3P0jjFDzEalbqc7AWCAdQdeNYXI5+6yie5bhbgEE8JcAQw5Z/kjVJKIeezsU+qtxC7HN5IlmvdiIgBgd+vpodGNbSXIS7VX5pEiyxVRz9LFZS9XDuvuoWcjcJUFjMQFxD27OXhQ/9lN+eA4ONplwcRegAmtPILjgMVXt5p9QPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IoDuV+/l; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IoDuV+/l"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-7feb6871730so1678549a12.2
        for <brcm80211@lists.linux.dev>; Fri, 13 Dec 2024 16:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734136855; x=1734741655; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AoYLMjyITYVzFC0pbwI0AfwRfXnUnSE1OGd5NIV400=;
        b=IoDuV+/lWwQFgaOVgyD/hCxP3eK9zc79orQ+APcg7oB3gl3knAVTqDM7oHLcvOgHZt
         NBbvD6tUQTJQr7XbyE60ZLsx8Y1ZlloHvay6M7IYCZzEWEwHZihzTLR0T5XcVln+7PYv
         SnJppdEiGSfcu1QY9RBtC0V/nG7DeoomgAZpHD+kiXwUjS+zPdI4BAO1WDda0NCg1BuF
         3nvk43hqJ3+mZFk71IQkDFrcr+oXIxBC35d3OxiRIrldqDbGC2cdwdpskKwwcWmxJmSA
         ha0aFn+Y1sfDGCizAHUAfHskW5upvSRxWOciSxtN0ugKQi+MiloBmOTzH8wb319TakEN
         v8tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734136855; x=1734741655;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AoYLMjyITYVzFC0pbwI0AfwRfXnUnSE1OGd5NIV400=;
        b=PY2NJvsOIJsFm6DH7G15VrvAJKiKU87iT5RnrWOfxHjhtVWdyVv8k1MTiZyo6ca+SL
         G7LDpHMKNf9c5PEnNT0EQBxSE6QTnD0lj/rDkFqp3nKuZlLdBbdfmnMNdiZ4nrCVjNza
         63StyzRx8+HxxJ267dqYSJokRRIPQwEZ6kud9Rn3vvl1HPed+edd2zfp63osxgHzNPF5
         dBXN7MB8d/gMOimD3EvSq1PKPEwx149VGKnzCXYqA3ksgbJuhSlJmrABnjNMA1GJrcDm
         +VBVk7aHZz7WAf1P/j3jsOYoIh+c8EKX5wzRPO76+0RtVP2kcuiHkgMyt6WgOsC2x+lq
         GfnA==
X-Gm-Message-State: AOJu0YzvQF8XSQouduoB5H4Z1qhUim6fqp7hKzQD4dvLQfQnj2WrqdnL
	6Z6qSCpsN+1aSr2sIr+AgtxqhvqmMi3LAna/+jWJyUHHkTH1KAyTPAuMH5FCrbGTgzmFwI1qRIN
	Nm1fre88o1lqk4EDVk16JFSn299w=
X-Gm-Gg: ASbGncv6AydWphh4YJHErszTvw20E+sjzcKKzQL3Ny9QE2qRHAPJ6t9fU1rO76KHI33
	OIP1NOdp3XdAaONlH3FcWwTMH6XvV8g7Hd+UNuDwbd5Lyr2VjyT6lOCUpAxR71MubTGufI1P/
X-Google-Smtp-Source: AGHT+IHQK8AAKmTngFXE5yC2zdTC3Pj0gjadpTVkeqQNb0qz69wBH6yhKz+09M4ZLdshprOYE5PeeyLZL1rsx/LuJAs=
X-Received: by 2002:a17:90b:1b10:b0:2ee:e158:125b with SMTP id
 98e67ed59e1d1-2f2900a6e40mr6386530a91.26.1734136854583; Fri, 13 Dec 2024
 16:40:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAG17S_OwtNxetb7XzsxkZcygH_CWkZx15evQZkThb3WjqpiKTQ@mail.gmail.com>
 <CAG17S_M9wxMsSNyqAQv2oxaCQZ9CAe=GHNjZCbw__2bsAg1hdg@mail.gmail.com>
 <ff9c1192-42b5-4a28-a8c9-31af9765cbff@broadcom.com> <CAG17S_PrigpkFP=5wcTL9UETwc6aHqXnuTEyeRrZ7Ey1cb-ZLw@mail.gmail.com>
 <193c1173968.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <193c1173968.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: KeithG <ys3al35l@gmail.com>
Date: Fri, 13 Dec 2024 18:40:43 -0600
Message-ID: <CAG17S_NwSKEJzbk7RNiOKqU_25f6muydbh0DN+ec1Ke6QrR1Qw@mail.gmail.com>
Subject: Re: brcmfmac SAE/WPA3 negotiation
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: brcm80211@lists.linux.dev, linux-wireless@vger.kernel.org, 
	Denis Kenzior <denkenz@gmail.com>, James Prestwood <prestwoj@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2024 at 11:35=E2=80=AFAM Arend Van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On December 13, 2024 4:13:17 PM KeithG <ys3al35l@gmail.com> wrote:
>
> > On Thu, Dec 12, 2024 at 2:17=E2=80=AFPM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> On 12/12/2024 3:24 PM, KeithG wrote:
> >>> Based on a hunch that brcmfmac dbug might reveal something, I turned
> >>> it on to see what turned up. I attempted the same as before: using iw=
d
> >>> to connect to the WPA3 AP.
> >>>
> >>> [iwd]# station wlan0 connect deskSAE
> >>> Type the network passphrase for deskSAE psk.
> >>> Passphrase: *********
> >>> [iwd]# station wlan0 show
> >>>                            Station: wlan0
> >>> ---------------------------------------------------------------------=
-----------
> >>> Settable  Property              Value
> >>> ---------------------------------------------------------------------=
-----------
> >>>       Scanning              no
> >>>       State                 connecting
> >>>       Connected network     deskSAE
> >>>       IPv4 address          169.254.203.147
> >>>
> >>> the attached log shows brcmfmac debug
> >>>
> >>> it always shows 'State connecting' never connected.
> >>>
> >>> Is one of these what is causing it to error out:
> >>> Dec 09 18:11:06 jackrune kernel: brcmfmac: brcmf_fil_cmd_data Firmwar=
e
> >>> error: BCME_UNSUPPORTED (-23)
> >>> Dec 09 18:11:06 jackrune kernel: brcmfmac: brcmf_fil_iovar_data_get
> >>> ifidx=3D0, name=3Dtdls_sta_info, len=3D296, err=3D-52
> >>> ...
> >>> Dec 09 18:11:06 jackrune kernel: brcmfmac: brcmf_fil_cmd_data Firmwar=
e
> >>> error: BCME_BADADDR (-21)
> >>> Dec 09 18:11:06 jackrune kernel: brcmfmac: brcmf_fil_iovar_data_get
> >>> ifidx=3D0, name=3Dsta_info, len=3D296, err=3D-52
> >>> ...
> >>> Dec 09 18:33:32 jackrune kernel: ieee80211 phy0:
> >>> brcmf_cfg80211_get_station: GET STA INFO failed, -52
> >>>
> >>> I do not know what BCME is.
> >>
> >> BCME are the error codes produced by the firmware. Without debug print=
s
> >> you will only see a generic error code, ie. -52 (-EBADE). So you alway=
s
> >> see the "Firmware error" message following by the "generic" error
> >> message. It is not truly generic as it mentions the command name. So t=
he
> >> above says the command "tdls_sta_info" is unsupported and the mac
> >> address provided in the "sta_info" command is not found in firmware.
> >>
> >> Looking at the log I see periodically:
> >>
> >> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_fil_cmd_data Firmware
> >> error: BCME_NOTASSOCIATED (-17)
> >> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_fil_cmd_data_get
> >> ifidx=3D0, cmd=3D23, len=3D6, err=3D-52
> >>
> >> According fwil.h the driver sends BRCMF_C_GET_BSSID command. When
> >> associated is returns the BSSID of your AP. As you are not yet
> >> associated it fails. Not really related to the external auth procedure=
 I
> >> think.
> >>
> >> The following is more interesting:
> >>
> >> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_cfg80211_external_aut=
h
> >> Enter
> >> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_fil_iovar_data_set
> >> ifidx=3D0, name=3Dauth_status, len=3D44
> >> Dec 09 18:32:55 jackrune kernel: brcmutil: data
> >> Dec 09 18:32:55 jackrune kernel: 00000000: 04 00 d8 3a dd 60 a3 0c 07 =
00
> >> 00 00 64 65 73 6b  ...:.`......desk
> >> Dec 09 18:32:55 jackrune kernel: 00000010: 53 41 45 00 00 00 00 00 00 =
00
> >> 00 00 00 00 00 00  SAE.............
> >> Dec 09 18:32:55 jackrune kernel: 00000020: 00 00 00 00 00 00 00 00 00 =
00
> >> 00 00              ............
> >> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_sdio_bus_txctl Enter
> >> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_sdio_bus_rxctl Enter
> >> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_sdio_isr Enter
> >> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_sdio_bus_rxctl resume=
d
> >> on rxctl frame, got 72 expected 72
> >> Dec 09 18:32:55 jackrune kernel: brcmfmac: brcmf_fil_cmd_data Firmware
> >> error: BCME_BADLEN (-24)
> >> Dec 09 18:32:55 jackrune kernel: ieee80211 phy0:
> >> brcmf_cfg80211_external_auth: auth_status iovar failed: ret=3D-52
> >>
> >> So the "auth_status" command fails and the firmware error code indicat=
es
> >> the length is invalid. The length of the "auth_status" command as sent
> >> by the driver to the device is 44 and apparently the firmware expects
> >> some other length. Here is what I did in my patch:
> >>
> >> +static int
> >> +brcmf_cyw_external_auth(struct wiphy *wiphy, struct net_device *dev,
> >> +                       struct cfg80211_external_auth_params *params)
> >> +{
> >> +       struct brcmf_if *ifp;
> >> +       struct brcmf_pub *drvr;
> >> +       struct brcmf_auth_req_status_le auth_status;
> >> +       int ret =3D 0;
> >> +
> >> +       brcmf_dbg(TRACE, "Enter\n");
> >> +
> >> +       ifp =3D netdev_priv(dev);
> >> +       drvr =3D ifp->drvr;
> >> +       if (params->status =3D=3D WLAN_STATUS_SUCCESS) {
> >> +               auth_status.flags =3D cpu_to_le16(BRCMF_EXTAUTH_SUCCES=
S);
> >> +       } else {
> >> +               bphy_err(drvr, "External authentication failed: status=
=3D%d\n",
> >> +                        params->status);
> >> +               auth_status.flags =3D cpu_to_le16(BRCMF_EXTAUTH_FAIL);
> >> +       }
> >> +
> >> +       memcpy(auth_status.peer_mac, params->bssid, ETH_ALEN);
> >> +       auth_status.ssid_len =3D cpu_to_le32(min_t(u8, params->ssid.ss=
id_len,
> >> +                                                IEEE80211_MAX_SSID_LE=
N));
> >> +       memcpy(auth_status.ssid, params->ssid.ssid, auth_status.ssid_l=
en);
> >> +
> >> +       ret =3D brcmf_fil_iovar_data_set(ifp, "auth_status", &auth_sta=
tus,
> >> +                                      sizeof(auth_status));
> >> +       if (ret < 0)
> >> +               bphy_err(drvr, "auth_status iovar failed: ret=3D%d\n",=
 ret);
> >> +
> >> +       return ret;
> >> +}
> >>
> >> So the type struct brcmf_auth_req_status_le is used for external auth
> >> request and for auth_status. Maybe for the "auth_status" it only needs=
 a
> >> subset of fields. Here is the struct declaration:
> >>
> >> +/**
> >> + * struct brcmf_auth_req_status_le - external auth request and status
> >> update
> >> + *
> >> + * @flags: flags for external auth status
> >> + * @peer_mac: peer MAC address
> >> + * @ssid_len: length of ssid
> >> + * @ssid: ssid characters
> >> + */
> >> +struct brcmf_auth_req_status_le {
> >> +       __le16 flags;
> >> +       u8 peer_mac[ETH_ALEN];
> >> +       __le32 ssid_len;
> >> +       u8 ssid[IEEE80211_MAX_SSID_LEN];
> >> +};
> >>
> >> Maybe flags and peer_mac is sufficient? That would be 8 bytes so can y=
ou
> >> try and change brcmf_cyw_external_auth() such that it does:
> >>
> >> +       ret =3D brcmf_fil_iovar_data_set(ifp, "auth_status", &auth_sta=
tus, 8);
> >>
> >> Without firmware source code we can only guess.
> >>
> >> Regards,
> >> Arend
> >>
> >>> On Mon, Dec 9, 2024 at 8:30=E2=80=AFAM KeithG <ys3al35l@gmail.com> wr=
ote:
> >>>>
> >>>> I poked at this a while back and decided to try it again over the we=
ekend.
> >>>>
> >>>> Infineon has released a new firmware:
> >>>> Firmware: BCM4345/6 wl0: Oct 28 2024 23:27:00 version 7.45.286
> >>>> (be70ab3 CY) FWID 01-95efe7fa
> >>>> it is not in the RPiOS release, yet, but I installed it on a Pi3B+ a=
nd
> >>>> decided to give it a try. I have an AP running WPA3 personal on a
> >>>> desktop in the home and can connect to it with my phone as proof tha=
t
> >>>> it 'works'.
> >>>>
> >>>> I tried to connect to it once again from the Pi while running this n=
ew
> >>>> firmware. It gets closer than last time I checked, but it does not
> >>>> actually negotiate a functional connection.
> >>>> I tried with connman/iwd, NetworkManager/iwd and it gets close, but
> >>>> still errors out. I get a number of these in the iwmon log:
> >>>>
> >>>>> Response: Get Station (0x11) len 4                                 =
 38.439787
> >>>> Status: Invalid exchange (52)
> >>>>
> >>>> Can I probe this further to assist in diagnosing the cause and
> >>>> potentially help with a solution?
> >>>> The log is attached.
> >>>>
> >>>> Regards,
> >>>>
> >>>> Keith
> > Arend,
> >
> > Does this iwmon log help at all.
>
> Probably not. The issue seems to be between driver and firmware.
>
> If there is anyone out there that successfully used the ext_auth with
> downstream ifx driver they could create the same log and see what length
> the auth_status command uses.
>
> I'll see what I can find.
>
> Regards,
> Arend

Arend,

I took a look anyway.

Don't know exactly what I am looking at, but it seems that this is
where it goes sideways:

> Event: Frame (0x3b) len 120                                          7.53=
0849
    Wiphy: 0 (0x00000000)
    Interface Index: 3 (0x00000003)
    Wireless Device: 1 (0x0000000000000001)
    Wiphy Frequency: 2412 (0x0000096c)
    Unknown: 290 len 4
        00 00 00 00                                      ....
    Frame: len 64
        Frame Type: 0x00b0
            Type: Management (0)
            Authentication:
                Frame Control: protocol: 00 type: 00 subtype: 11 to:
00 from: 00 more_frags: 00
                    retry: 00 power_mgmt: 00 more_data: 00 protected:
00 order: 00
                Duration: 0
                Address 1 (RA): B8:27:EB:A4:6E:0F
                Address 2 (TA): D8:3A:DD:60:A3:0C
                Address 3: 00:00:00:00:00:00
                Fragment Number: 0
                Sequence Number: 0
                Algorithm: SAE (seq: 2, status: 0)
                IEs: len 34
                    Error decoding Supported rates IE len 0: Invalid
argument (-22)
        b0 00 00 00 b8 27 eb a4 6e 0f d8 3a dd 60 a3 0c  .....'..n..:.`..
        00 00 00 00 00 00 00 00 03 00 02 00 00 00 01 00  ................
        b3 a1 af e2 4c 57 c9 0d 5e 56 0d 70 91 58 e1 53  ....LW..^V.p.X.S
        5c 1c 6c 20 05 78 9b d9 81 ce b9 b8 f4 8b a8 c7  \.l .x..........
    RX Management Flags: 2 (0x00000002)
< Request: External Auth (0x7f) len 40 [ack]                           7.53=
1125
    Interface Index: 3 (0x00000003)
    Status Code: 0 (0x0000)
    SSID: len 7
        64 65 73 6b 53 41 45                             deskSAE
    BSSID D8:3A:DD:60:A3:0C
> Response: External Auth (0x7f) len 4                                 7.53=
1626
    Status: Invalid exchange (52)
< Request: Get Station (0x11) len 20 [ack]                             8.41=
0689
    Interface Index: 3 (0x00000003)
    MAC Address D8:3A:DD:60:A3:0C
> Response: Get Station (0x11) len 4                                   8.41=
5045
    Status: Invalid exchange (52)
