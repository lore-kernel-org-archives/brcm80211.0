Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA82148833
	for <brcm80211@lists.linux.dev>; Thu, 27 Jun 2024 11:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719488113; cv=none; b=ft4SpzsDLbmgOae9Ee1T6wtvKvQOzQlX7baw71iIgRxl0tqX0HmqmvGqzdNbvggtupRCoUW79qZMmS7eXqvHo4pVoK2OxHgryx9ngfqgXIcOcAInYpRbc/I7VX4VHw1Z7YYVPw7Bf0aDXudx+xls9odPceb/iL5eauN4yd2ei9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719488113; c=relaxed/simple;
	bh=hiSZ+alpgPM7pUNV78wPNuDGeYyfhmdyMaTu0YXbp30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dw4adtPIh7pdCFcO4f8A66ie/5RZ0O9lo0A+3YupH+2jX2ovtWWXjIF+VvRcME3vjKNWmAxNntkVMhXGZHX0816+Fr4Trxraok1svTRPB1H2dMffWLkAQhXKMXyu9oE63TMi9C7SsqKTEJALcRwkwYK9ZTKuPaz+7W4pEYlJLtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l7pXwY/c; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l7pXwY/c"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2c80657e4a3so5146368a91.0
        for <brcm80211@lists.linux.dev>; Thu, 27 Jun 2024 04:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719488111; x=1720092911; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpNggV/mdQ6rEMzfVrquC2tWupRGEf122HVjUNXywME=;
        b=l7pXwY/cCweHOjXq+jzcBbOLNKd4/HFo6YnNuYYy07ZebG8DFdvB0PAf6w9cJFkeVW
         6NbAdVsCrPAWgz98KSXsd6WQ/HuXeDlMDptUUNGLA6I8ecjdZedi5llfR7G6zqyBtMvn
         NHfu4DdcO5kbgMttf0HY6b5IQSDqTDgdz1eg/VZlwDzOXd4qfBH93w9T6dRf7NHrLZ+i
         07SxR7j3q8W8BYyNIPkx0VDWlZkqllaSF/28W6bue7s0WjJb4+x528nwPDYmDjl3hMOm
         R6ynwT0K4MgrumIs2jMH77kMUV438arOKJCdfBtWmtS8qrZglThxJ6/GQtR2YhkuP8nU
         mqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719488111; x=1720092911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpNggV/mdQ6rEMzfVrquC2tWupRGEf122HVjUNXywME=;
        b=UreLG1LQxLDJL5Ei+RZfqpxV4QkyxnplDqdMSlpWyyCIsrOdq/D/W1BSUNHuz0ISqX
         tLI8b/WBnb0xoDvSnOKK+WJj3txeJ0HgYyYHhhKIIgMzkxB3MIz640lsRrb3MwX/NSlj
         HoGPuiVfrYH2j+jDdncsV3LQYlM7xYQvEOOdRfPT4NbSppohGC5J+kKVhCl+e+wnrtZg
         mS8oLlA5Li1QXt+v+hisDoDziM3GfV+tgmM0BtSkeA+XjkC9nMLEjrUosi6ew7MVGDAI
         qG2nzHms+s56xc1pU478iOfQYLOCfhA1vfA3qCVwTH3fNyQr8mtNRkKFghQ6w5rlszsw
         uJIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSCKlL7Oa4Q3yzi7lIcOdGA1TmPpejpUJ7xXjWRbRfOnW3+F+ns6zDdqpyNX8A3NpwbYKGV/PGIxNnsyKEaw47aWRUU+W0pUi5
X-Gm-Message-State: AOJu0YxxpEM4moQxzPWTijTVWFHe6Mbnf7/ts941b1FfwAGZwZhjWpA/
	EXP4vvY3UvsA9DQ9BbX2fpplZDk8CsHJ6N+TXZ2SjgP57MT2IM17/X9HkrfM05CKg36H3DDy4Xq
	MRPoCZfnP1AbsNZFEXAXmMz11zCo=
X-Google-Smtp-Source: AGHT+IEjr6vdC5gYoPMqMRSeZtps8JfBTIkfRwAlSo6Pw8nfV+izXwIK2sguhBAsL2JaKmvLRHxLBfUShLSLgJFhqyg=
X-Received: by 2002:a17:90b:4b92:b0:2c0:17b4:85aa with SMTP id
 98e67ed59e1d1-2c861430a8cmr11081584a91.22.1719488111252; Thu, 27 Jun 2024
 04:35:11 -0700 (PDT)
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
 <CAG17S_MPwwgzup17zwHmNH87RS9mrwn7A8v0FkntQx2du6fLig@mail.gmail.com>
 <19054769d10.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAG17S_NojmnuQqLyOAT6+Tq4OLaBVc1FY6J8cqwWvo_VxcNLiA@mail.gmail.com> <19058122ea8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <19058122ea8.279b.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
From: KeithG <ys3al35l@gmail.com>
Date: Thu, 27 Jun 2024 06:34:59 -0500
Message-ID: <CAG17S_Paw=634Q5zNm8jM2c_66OMscN1ngxR53kF=DJHKU2N1A@mail.gmail.com>
Subject: Re: brcmfmac: how to setup SAE on RPi // Re: [PATCH] wifi: brcmsmac:
 advertise MFP_CAPABLE to enable WPA3
To: Arend Van Spriel <arend.vanspriel@broadcom.com>
Cc: Peter Robinson <pbrobinson@gmail.com>, Julian Calaby <julian.calaby@gmail.com>, 
	Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, Jouni Malinen <j@w1.fi>, hostap@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 12:01=E2=80=AFAM Arend Van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On June 27, 2024 12:47:02 AM KeithG <ys3al35l@gmail.com> wrote:
>
> > On Wed, Jun 26, 2024 at 7:30=E2=80=AFAM Arend Van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> On June 26, 2024 2:05:07 PM KeithG <ys3al35l@gmail.com> wrote:
> >>
> >>> On Wed, Jun 26, 2024 at 2:48=E2=80=AFAM Arend Van Spriel
> >>> <arend.vanspriel@broadcom.com> wrote:
> >>>>
> >>>> On June 21, 2024 2:24:19 PM KeithG <ys3al35l@gmail.com> wrote:
> >>>>
> >>>>> On Fri, Jun 21, 2024 at 4:09=E2=80=AFAM Arend van Spriel
> >>>>> <arend.vanspriel@broadcom.com> wrote:
> >>>>>>
> >>>>>> + Jouni
> >>>>>>
> >>>>>> On 6/20/2024 8:25 PM, KeithG wrote:
> >>>>>>> 1718907734.308740: wlan0: WPA: AP group 0x10 network profile grou=
p
> >>>>>>> 0x18; available group 0x10
> >>>>>>> 1718907734.308748: wlan0: WPA: using GTK CCMP
> >>>>>>> 1718907734.308758: wlan0: WPA: AP pairwise 0x10 network profile
> >>>>>>> pairwise 0x10; available pairwise 0x10
> >>>>>>> 1718907734.308767: wlan0: WPA: using PTK CCMP
> >>>>>>> 1718907734.308772: wlan0: WPA: AP key_mgmt 0x400 network profile
> >>>>>>> key_mgmt 0x400; available key_mgmt 0x0
> >>>>>>
> >>>>>>
> >>>>>> I suspect the message above indicates the problem as there is no
> >>>>>> available key_mgmt to select so looked it up in the code and here =
it is:
> >>>>>>
> >>>>>> sel =3D ie.key_mgmt & ssid->key_mgmt;
> >>>>>> #ifdef CONFIG_SAE
> >>>>>> if ((!(wpa_s->drv_flags & WPA_DRIVER_FLAGS_SAE) &&
> >>>>>> !(wpa_s->drv_flags2 & WPA_DRIVER_FLAGS2_SAE_OFFLOAD_STA)) ||
> >>>>>> wpas_is_sae_avoided(wpa_s, ssid, &ie))
> >>>>>> sel &=3D ~(WPA_KEY_MGMT_SAE | WPA_KEY_MGMT_SAE_EXT_KEY |
> >>>>>> WPA_KEY_MGMT_FT_SAE |
> >>>>>> WPA_KEY_MGMT_FT_SAE_EXT_KEY);
> >>>>>> #endif /* CONFIG_SAE */
> >>>>>> #ifdef CONFIG_IEEE80211R
> >>>>>> if (!(wpa_s->drv_flags & (WPA_DRIVER_FLAGS_SME |
> >>>>>>         WPA_DRIVER_FLAGS_UPDATE_FT_IES)))
> >>>>>> sel &=3D ~WPA_KEY_MGMT_FT;
> >>>>>> #endif /* CONFIG_IEEE80211R */
> >>>>>> wpa_dbg(wpa_s, MSG_DEBUG,
> >>>>>> "WPA: AP key_mgmt 0x%x network profile key_mgmt 0x%x;
> >>>>>> available key_mgmt 0x%x",
> >>>>>> ie.key_mgmt, ssid->key_mgmt, sel);
> >>>>>>
> >>>>>> So 0x400 matches the expectation:
> >>>>>>
> >>>>>> #define WPA_KEY_MGMT_SAE BIT(10)
> >>>>>>
> >>>>>> You already confirmed that the driver reports SAE and SAE offload
> >>>>>> support. So it seems wpas_is_sae_avoided() must return true. That =
will
> >>>>>> check whether the AP and network profile are setup to MFP. This se=
ems to
> >>>>>> be the fact as your hostapd.conf and wpa_supplicant.conf both have
> >>>>>> ieee80211w=3D2 defined. This function can only return true when
> >>>>>> is enabled in configuration file:
> >>>>>>
> >>>>>> # sae_check_mfp: Require PMF support to select SAE key_mgmt
> >>>>>> # 0 =3D Do not check PMF for SAE (default)
> >>>>>> # 1 =3D Limit SAE when PMF is not enabled
> >>>>>> #
> >>>>>> # When enabled SAE will not be selected if PMF will not be used
> >>>>>> # for the connection.
> >>>>>> # Scenarios where this check will limit SAE:
> >>>>>> #  1) ieee80211w=3D0 is set for the network
> >>>>>> #  2) The AP does not have PMF enabled.
> >>>>>> #  3) ieee80211w is unset, pmf=3D1 is enabled globally, and
> >>>>>> #     the device does not support the BIP cipher.
> >>>>>> # Consider the configuration of global parameterss sae_check_mfp=
=3D1,
> >>>>>> pmf=3D1 and a
> >>>>>> # network configured with ieee80211w unset and key_mgmt=3DSAE WPA-=
PSK.
> >>>>>> # In the example WPA-PSK will be used if the device does not suppo=
rt
> >>>>>> # the BIP cipher or the AP has PMF disabled.
> >>>>>> # Limiting SAE with this check can avoid failing to associate to a=
n AP
> >>>>>> # that is configured with sae_requires_mfp=3D1 if the device does
> >>>>>> # not support PMF due to lack of the BIP cipher.
> >>>>>>
> >>>>>> The default is not to check it and you wpa_supplicant.conf does no=
t
> >>>>>> specify it.
> >>>>>>
> >>>>>> # cat /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
> >>>>>> ctrl_interface=3DDIR=3D/run/wpa_supplicant GROUP=3Dnetdev
> >>>>>> update_config=3D1
> >>>>>> network=3D{
> >>>>>> ssid=3D"deskSAE"
> >>>>>> sae_password=3D"secret123"
> >>>>>> proto=3DRSN
> >>>>>> key_mgmt=3DSAE
> >>>>>> pairwise=3DCCMP
> >>>>>> ieee80211w=3D2
> >>>>>> }
> >>>>>>
> >>>>>> $ cat /etc/hostapd/hostapd.conf
> >>>>>> # interface and driver
> >>>>>> interface=3Dap0
> >>>>>> driver=3Dnl80211
> >>>>>>
> >>>>>> # WIFI-Config
> >>>>>> ssid=3DdeskSAE
> >>>>>> channel=3D1
> >>>>>> hw_mode=3Dg
> >>>>>>
> >>>>>> wpa=3D2
> >>>>>> wpa_key_mgmt=3DSAE
> >>>>>> wpa_pairwise=3DCCMP
> >>>>>> sae_password=3Dsecret123
> >>>>>> sae_groups=3D19
> >>>>>> ieee80211w=3D2
> >>>>>> sae_pwe=3D0
> >>>>>>
> >>>>>> Regards,
> >>>>>> Arend
> >>>>>>
> >>>>>>
> >>>>>>> 1718907734.308779: wlan0: WPA: Failed to select authenticated key
> >>>>>>> management type
> >>>>>>> 1718907734.308787: wlan0: WPA: Failed to set WPA key management a=
nd
> >>>>>>> encryption suites
> >>>>>
> >>>>> Arend,
> >>>>>
> >>>>> I find the wpa_supplicant docs really hard to understand. I have re=
ad
> >>>>> through your response a few times and am still a bit confused. Does
> >>>>> this have to do with a pure wpa3 versus a wpa2/3 AP?
> >>>>
> >>>> Correct. If I am not mistaken MFP aka PMF aka 802.11w is mandatory f=
or WPA3.
> >>>>
> >>>>> I have tried editing my hostapd.conf and my wpa_supplicant.conf and
> >>>>> still cannot get a connection, so I must be doing something wrong.
> >>>>> I commented the ieee80211w line on both and it would not connect.
> >>>>> I tried changing the wpa_key_mgmt on both ends to be 'SAE WPA_PSK' =
and
> >>>>> it still would not connect.
> >>>>>
> >>>>> What *should* the configurations be in the hostapd.conf and
> >>>>> wpa_supplicant.conf to negotiate this as a pure wpa3 setup? What
> >>>>> should it be to be a wpa2/3 setup? My phone worked fine to connect
> >>>>> with the original hostapd setup, but I have no idea what it is doin=
g
> >>>>
> >>>> As I mentioned in my previous email both config files listed above l=
ook
> >>>> okay to me (might be wrong though). The problem seems to be with
> >>>> wpas_is_sae_avoided(). For it to return true the config should have:
> >>>>
> >>>> sae_check_mfp=3D1
> >>>>
> >>>> But you don't have that and default is 0 so it should check for MFP.=
 This
> >>>> is where my trail ends. To learn more I would add additional debug p=
rints.
> >>>> Are you comfortable rebuilding wpa_supplicant from source?
> >>>>
> >>>> Regards,
> >>>> Arend
> >>>
> >>> Arend,
> >>>
> >>> Thanks for the reply. I could try to rebuild wpa_supplicant from
> >>> source. This is on RPi, so debian *.debs which are a pain, but I thin=
k
> >>> I can do it.
> >>>
> >>> Do I understand correctly that 'sae_check_mfp=3D1' is supposed to be =
in
> >>> the hostapd.conf and wpa_supplicant.conf? I can try that and see if
> >>> anything changes.
> >>
> >> Ok. We can try first to put following in wpa_supplicant.conf:
> >>
> >> sae_check_mfp=3D0
> >>
> >> Let me know if that makes any difference.
> >>
> >>> Why would I have to re-build wpa_supplicant?
> >>
> >> I would provide a patch with additional debug prints so I get better
> >> understanding what is going wrong. Would be great if you can apply tha=
t and
> >> rebuild.
> >>
> >> Regards,
> >> Arend
> > Arend,
> >
> > I was able to try it this afternoon.
> > My hostapd is still:
> > # interface and driver
> > interface=3Dap0
> > driver=3Dnl80211
> >
> > # WIFI-Config
> > ssid=3DdeskSAE
> > channel=3D1
> > hw_mode=3Dg
> >
> > wpa=3D2
> > wpa_key_mgmt=3DSAE
> > wpa_pairwise=3DCCMP
> > sae_password=3Dsecret123
> > sae_groups=3D19
> > ieee80211w=3D2
> > sae_pwe=3D0
> >
> > and I can still connect from my phone to this AP.
> >
> > I tried this as my /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
> > ctrl_interface=3DDIR=3D/run/wpa_supplicant GROUP=3Dnetdev
> > update_config=3D1
> > network=3D{
> >  ssid=3D"deskSAE"
> >  sae_password=3D"secret123"
> >  proto=3DRSN
> >  key_mgmt=3DSAE
> >  pairwise=3DCCMP
> >  ieee80211w=3D2
> >  sae_check_mfp=3D1
> > }
> >
> > and when I try to connect, I get:
> > # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant-wlan0.c=
onf
> > Successfully initialized wpa_supplicant
> > Line 10: unknown network field 'sae_check_mfp'.
> > Line 11: failed to parse network block.
>
> Right. The setting sae_check_mfp is a global setting like update_config. =
So
> it should be moved outside the network block.
>
> Regards,
> Arend
>
Arend,

Thanks for the hand holding, I am out of my depth here!

I tried this config and get a similar result.
ctrl_interface=3DDIR=3D/run/wpa_supplicant GROUP=3Dnetdev
update_config=3D1
sae_check_mfp=3D1
 network=3D{
  ssid=3D"deskSAE"
  sae_password=3D"secret123"
  proto=3DRSN
  key_mgmt=3DSAE
  pairwise=3DCCMP
  ieee80211w=3D2
}
# wpa_supplicant -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant-wlan0.conf
Successfully initialized wpa_supplicant
Line 3: unknown global field 'sae_check_mfp=3D1'.
Line 3: Invalid configuration line 'sae_check_mfp=3D1'.
Failed to read or parse configuration
'/etc/wpa_supplicant/wpa_supplicant-wlan0.conf'.
: CTRL-EVENT-DSCP-POLICY clear_all

seems it doesn't recognize this parameter.

Keith
