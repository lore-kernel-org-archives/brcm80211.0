Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C9B180A93
	for <brcm80211@lists.linux.dev>; Wed, 26 Jun 2024 12:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719403509; cv=none; b=sLqtofzMBx9MJuMy7RGhoDbnbrwU9TFrdqVhLfqu8rMaa2DHSFuS/b38lER790gOd1u2Vr2a2MKsdD2yK8bpvvs1/3VDSTAjILM23hOicmEoaSCdDMo2xIS4WCwJvk5mjOR1p4jFGJGIJKcHtJvb32ysWtCh8kdujnzYrTPallw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719403509; c=relaxed/simple;
	bh=NBEFTzkklGFGDVG2/xtdV1orAF8Jslvtw0j0Fq+A/u8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h69+oTx9XVKzYrYRVjchrqGOity9zIOJdSp07XQE+IDDpWVU5POxLgPWNzsbiE451f1nqjdcBMdc/t+o0Z7w5gbsJoPvPj37et9NcGc2XOjVgPbuI39cs0R3h+l6ElII95cc/wqeBp4JcsGJnSo1SbxviTjxoHssjq2LQIrYOTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NaQcpKKg; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NaQcpKKg"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-710437d0affso4956199a12.3
        for <brcm80211@lists.linux.dev>; Wed, 26 Jun 2024 05:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719403507; x=1720008307; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1UCfu79HmhWSdtl/1wXnfzkyBlaEjaZcIKqYIxg5bUw=;
        b=NaQcpKKgfbdPO8IXEgDfwdLjVeJu9jZIaGyjTNxmRVzmW923yzlgs2ciEY62YoVVNL
         Yj+0+sR66mcQKWaeDOWDvaBSIvfXa0YLg32TQ3++QJUZQpvHEJZSWt5IVd4soUcY5qvc
         V2b1nybFLio8qHLSuvPouIGDix+gMKzvuzSYQ81pVONGA0+YbSC7Y6IXKeUsFkDgi6Wd
         DHKo4OQoNvUd8l3u3qR1LUa6ZnFCTl4XTPwsFlK6yYzF5mdbkfqRFqvNrkTZi8Y8nbtm
         EYKgMAmc11DUuGBC+eG/OoH15pn9zVYmYwJv5oBliHsepEcUxH2AExUlZi3FSr1Hl+Tr
         HOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719403507; x=1720008307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1UCfu79HmhWSdtl/1wXnfzkyBlaEjaZcIKqYIxg5bUw=;
        b=c1yvQ+hg1Zt1cBZCWWLVV9RliSFE7WP5QcBfBc6QJYBP1JnZzo0cUK1zAX7yy4AFRv
         hGxiLQIbcSp9Mh7GpHiwuHE8uWMJeO4bvmUh1ePo63xUkuEjG3yFIB51FASfHnnfN2Vh
         nA+eHDRsdOqnVVzDXJsbJIoqhdCLUC5KlwQiBY2wzZU7fHhdGBmBFH3cp05djmCkOpAo
         /0EYHL5sjCECvwng04X84cPOIek/p7mexFcsx58I9jJtv1IkI5x8hhRgM1ELhSHmvtO0
         qPu1WQrnFxWdgwBrsu3iFpSGitYwlgnRbFV582kC4NFxiuOR9A/4tDYMRgLAeZDOX7Qz
         N2nA==
X-Forwarded-Encrypted: i=1; AJvYcCUtv7Hph5fYLJ3CrR4FEaVZEjuneUG1cDVK+5PB7gxxoiMGJRBORUMjOuFWtSTk5zspGNsY0YcceAkI/Y1jKkBuyo1KIog8iXmy
X-Gm-Message-State: AOJu0Yyd18+O7lnnv8xWvh72cDwMgi0qPRO+1Dtztbtg7Npqx+nkCP6z
	JKU066/nxy6B4GlmdlM738y58mGUwWePRejK2kk8mftGLpNw5vluWLGKGYvWALv9wJNqlERyvP/
	GcH4bGNFH2tK5EttChQKkirzyDiroxl6N
X-Google-Smtp-Source: AGHT+IGd0NoEbFjS7olP1xxMX4lVfuZPb+3O2FokBowu6HNfyG/mz6ggTlIDanwox5pVv8HyeXp4S1l/zy7bVXc90iI=
X-Received: by 2002:a17:90a:f3d5:b0:2c2:d250:2813 with SMTP id
 98e67ed59e1d1-2c86127e27fmr8372737a91.1.1719403506903; Wed, 26 Jun 2024
 05:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617122609.349582-1-arend.vanspriel@broadcom.com>
 <CALeDE9O7DCPhoxdMyHmYFOjwdkPRepiaaC92QorzSTXCduZ+xQ@mail.gmail.com>
 <CAGRGNgWH9U3XeatXA9xpkLz76COuL1xjYcfXQYLTGKBxvy=M-A@mail.gmail.com>
 <CALeDE9M78so=roEFion9GGo4tV7c+M885=ZNZgi9zKyBur+iMQ@mail.gmail.com>
 <190355aedf0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAG17S_NBO=tTBp9GX=S9C4REbT-Gx634n66+7JERcWbe-KXt-g@mail.gmail.com>
 <190369b8c10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAG17S_NHC7EqUMtc58eSY9Yoq4K0mvp=C1rcP8PTRzajXW3Csg@mail.gmail.com>
 <c065ae75-f89e-4b14-9fc3-6ef19e6d144b@broadcom.com> <CAG17S_OMV5TpCO+XwP-6dQNB_zVs+OCoawpngZUshuDOgFOF0w@mail.gmail.com>
 <1905383f7e0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <1905383f7e0.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: KeithG <ys3al35l@gmail.com>
Date: Wed, 26 Jun 2024 07:04:56 -0500
Message-ID: <CAG17S_MPwwgzup17zwHmNH87RS9mrwn7A8v0FkntQx2du6fLig@mail.gmail.com>
Subject: Re: brcmfmac: how to setup SAE on RPi // Re: [PATCH] wifi: brcmsmac:
 advertise MFP_CAPABLE to enable WPA3
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Peter Robinson <pbrobinson@gmail.com>, Julian Calaby <julian.calaby@gmail.com>, 
	Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, Jouni Malinen <j@w1.fi>, hostap@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 2:48=E2=80=AFAM Arend Van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On June 21, 2024 2:24:19 PM KeithG <ys3al35l@gmail.com> wrote:
>
> > On Fri, Jun 21, 2024 at 4:09=E2=80=AFAM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> + Jouni
> >>
> >> On 6/20/2024 8:25 PM, KeithG wrote:
> >>> 1718907734.308740: wlan0: WPA: AP group 0x10 network profile group
> >>> 0x18; available group 0x10
> >>> 1718907734.308748: wlan0: WPA: using GTK CCMP
> >>> 1718907734.308758: wlan0: WPA: AP pairwise 0x10 network profile
> >>> pairwise 0x10; available pairwise 0x10
> >>> 1718907734.308767: wlan0: WPA: using PTK CCMP
> >>> 1718907734.308772: wlan0: WPA: AP key_mgmt 0x400 network profile
> >>> key_mgmt 0x400; available key_mgmt 0x0
> >>
> >>
> >> I suspect the message above indicates the problem as there is no
> >> available key_mgmt to select so looked it up in the code and here it i=
s:
> >>
> >> sel =3D ie.key_mgmt & ssid->key_mgmt;
> >> #ifdef CONFIG_SAE
> >> if ((!(wpa_s->drv_flags & WPA_DRIVER_FLAGS_SAE) &&
> >> !(wpa_s->drv_flags2 & WPA_DRIVER_FLAGS2_SAE_OFFLOAD_STA)) ||
> >> wpas_is_sae_avoided(wpa_s, ssid, &ie))
> >> sel &=3D ~(WPA_KEY_MGMT_SAE | WPA_KEY_MGMT_SAE_EXT_KEY |
> >>          WPA_KEY_MGMT_FT_SAE |
> >> WPA_KEY_MGMT_FT_SAE_EXT_KEY);
> >> #endif /* CONFIG_SAE */
> >> #ifdef CONFIG_IEEE80211R
> >> if (!(wpa_s->drv_flags & (WPA_DRIVER_FLAGS_SME |
> >>                   WPA_DRIVER_FLAGS_UPDATE_FT_IES)))
> >> sel &=3D ~WPA_KEY_MGMT_FT;
> >> #endif /* CONFIG_IEEE80211R */
> >> wpa_dbg(wpa_s, MSG_DEBUG,
> >> "WPA: AP key_mgmt 0x%x network profile key_mgmt 0x%x;
> >> available key_mgmt 0x%x",
> >> ie.key_mgmt, ssid->key_mgmt, sel);
> >>
> >> So 0x400 matches the expectation:
> >>
> >> #define WPA_KEY_MGMT_SAE BIT(10)
> >>
> >> You already confirmed that the driver reports SAE and SAE offload
> >> support. So it seems wpas_is_sae_avoided() must return true. That will
> >> check whether the AP and network profile are setup to MFP. This seems =
to
> >> be the fact as your hostapd.conf and wpa_supplicant.conf both have
> >> ieee80211w=3D2 defined. This function can only return true when
> >> is enabled in configuration file:
> >>
> >> # sae_check_mfp: Require PMF support to select SAE key_mgmt
> >> # 0 =3D Do not check PMF for SAE (default)
> >> # 1 =3D Limit SAE when PMF is not enabled
> >> #
> >> # When enabled SAE will not be selected if PMF will not be used
> >> # for the connection.
> >> # Scenarios where this check will limit SAE:
> >> #  1) ieee80211w=3D0 is set for the network
> >> #  2) The AP does not have PMF enabled.
> >> #  3) ieee80211w is unset, pmf=3D1 is enabled globally, and
> >> #     the device does not support the BIP cipher.
> >> # Consider the configuration of global parameterss sae_check_mfp=3D1,
> >> pmf=3D1 and a
> >> # network configured with ieee80211w unset and key_mgmt=3DSAE WPA-PSK.
> >> # In the example WPA-PSK will be used if the device does not support
> >> # the BIP cipher or the AP has PMF disabled.
> >> # Limiting SAE with this check can avoid failing to associate to an AP
> >> # that is configured with sae_requires_mfp=3D1 if the device does
> >> # not support PMF due to lack of the BIP cipher.
> >>
> >> The default is not to check it and you wpa_supplicant.conf does not
> >> specify it.
> >>
> >> # cat /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
> >> ctrl_interface=3DDIR=3D/run/wpa_supplicant GROUP=3Dnetdev
> >> update_config=3D1
> >> network=3D{
> >> ssid=3D"deskSAE"
> >> sae_password=3D"secret123"
> >> proto=3DRSN
> >> key_mgmt=3DSAE
> >> pairwise=3DCCMP
> >> ieee80211w=3D2
> >> }
> >>
> >> $ cat /etc/hostapd/hostapd.conf
> >> # interface and driver
> >> interface=3Dap0
> >> driver=3Dnl80211
> >>
> >> # WIFI-Config
> >> ssid=3DdeskSAE
> >> channel=3D1
> >> hw_mode=3Dg
> >>
> >> wpa=3D2
> >> wpa_key_mgmt=3DSAE
> >> wpa_pairwise=3DCCMP
> >> sae_password=3Dsecret123
> >> sae_groups=3D19
> >> ieee80211w=3D2
> >> sae_pwe=3D0
> >>
> >> Regards,
> >> Arend
> >>
> >>
> >>> 1718907734.308779: wlan0: WPA: Failed to select authenticated key
> >>> management type
> >>> 1718907734.308787: wlan0: WPA: Failed to set WPA key management and
> >>> encryption suites
> >
> > Arend,
> >
> > I find the wpa_supplicant docs really hard to understand. I have read
> > through your response a few times and am still a bit confused. Does
> > this have to do with a pure wpa3 versus a wpa2/3 AP?
>
> Correct. If I am not mistaken MFP aka PMF aka 802.11w is mandatory for WP=
A3.
>
> > I have tried editing my hostapd.conf and my wpa_supplicant.conf and
> > still cannot get a connection, so I must be doing something wrong.
> > I commented the ieee80211w line on both and it would not connect.
> > I tried changing the wpa_key_mgmt on both ends to be 'SAE WPA_PSK' and
> > it still would not connect.
> >
> > What *should* the configurations be in the hostapd.conf and
> > wpa_supplicant.conf to negotiate this as a pure wpa3 setup? What
> > should it be to be a wpa2/3 setup? My phone worked fine to connect
> > with the original hostapd setup, but I have no idea what it is doing
>
> As I mentioned in my previous email both config files listed above look
> okay to me (might be wrong though). The problem seems to be with
> wpas_is_sae_avoided(). For it to return true the config should have:
>
> sae_check_mfp=3D1
>
> But you don't have that and default is 0 so it should check for MFP. This
> is where my trail ends. To learn more I would add additional debug prints=
.
> Are you comfortable rebuilding wpa_supplicant from source?
>
> Regards,
> Arend
>
>

Arend,

Thanks for the reply. I could try to rebuild wpa_supplicant from
source. This is on RPi, so debian *.debs which are a pain, but I think
I can do it.

Do I understand correctly that 'sae_check_mfp=3D1' is supposed to be in
the hostapd.conf and wpa_supplicant.conf? I can try that and see if
anything changes.

Why would I have to re-build wpa_supplicant?

Keith

Keith
