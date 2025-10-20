Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409522E972E
	for <brcm80211@lists.linux.dev>; Mon, 20 Oct 2025 08:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760949108; cv=none; b=JRXLU1JqExUxPT1PyTg5N3uA7f4g2Orj0NVYtATFnwLRaFd1h7JPPolCQv0eyJNW03E6QTeoNL82Bt8K0G3yTyEADgYVNf87SXTHBVYTKn0pE1CtzHUYhYM7wjIN3i5dpmXic9dJBG14+IN1Xlw6JRxKycJARrYkLLEEUOA2aF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760949108; c=relaxed/simple;
	bh=ZvD3ZMZdL1w/6XegkMJCVYKZa/CKWyTVrD/45o3+BFI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CYAWBpzaY0FfYHNW9CGjLBtQokJbkIARRpPS/Ff9XITId8jYI65MmM+isPcjexkce03nrcfLD1BTj7iRVJgEbbFCr+fXL8XykiKNnPLk7DmQ8XC0eR04WFcMfg2CP/U2NaOErEqxfFilwaQSnKMB9vwDEKjSFngT3dTSLlbNxhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zfe/aIb+; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zfe/aIb+"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3652d7800a8so31113521fa.0
        for <brcm80211@lists.linux.dev>; Mon, 20 Oct 2025 01:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760949104; x=1761553904; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/A4cHmYOWCf0dL97JI4s6z4lNHCMjZua/3EXqu47DJI=;
        b=Zfe/aIb+oYjNMXZNLL/wBnn0VGfmJLVJFs9TBX41qwFgsO+eD4TVc2iZfrMFlCZOvw
         H2h0CaY1MoFTWad1wvt0apGG/WZTUMPj2D5rK6oy15HBMWl1Qj2BJ+tXJfqB0yXpIx6l
         bMO+XLCWr8MVmb5tVyabGAZU+i1jlbC96W7vqFBlwM4btjKoJJAiD76Q54dwb1ozD+ur
         QqdC9opSaTEyYPxHYqYjxeXaBjwCbSsgmQL69b6HeNAgrAy9WOIae2YJ7jr3R55M9v8G
         SBZP0ed3s2YvY6ltxyLLg/MZ3luWZvcq/uogm9nnY9LHW8B2WcSAiKVKZC9ZBE1IT9ag
         Usuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760949104; x=1761553904;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/A4cHmYOWCf0dL97JI4s6z4lNHCMjZua/3EXqu47DJI=;
        b=FDofDkKV4ghaT5S8jbi4U6AphFn1FB+sXrbzyu1DJaUtMgR2O4FyrvZnFC6f1x/eJC
         +fN1tliOfgqmUK1RP98lCiy8PO+FnPrv6w8Y/HBmpa/YlEhQ2A1D2WMevm5BxKfq8Gok
         6Wpa4FP/FjGC961QQft01K/eZnFJnNS7wCMPkke01VcxQtdgyY4tm7eXc3PrQsqgLJG2
         nyxtYO5M4KfqBJvoxHYOtoDHSVCKLL6x4dlkKBVHDcn2OG5rPIEOfqrUMDksJt8cVObC
         xkmN2DawXMJuV/yD8QOKQQ/VW+z2GGEQhV+fboxQsjcQu2ABnbw0r3+O/+obmTPsujvt
         43mg==
X-Forwarded-Encrypted: i=1; AJvYcCVQmOnw+jF2Z+NH6FVyhYPr2Rl9hu3PJZdWodEs8liIyZ4Dd4vEDgBsojPRkzoGK4R5hK1RiVmnjlM=@lists.linux.dev
X-Gm-Message-State: AOJu0YytgHomBeBiSUZ5twv3JZ46LHtxoxqzXldDGVD30ATEmHaOVX3c
	gKOLaxcM98QrgrrX6X83hAg+//6SiQgODrPS7KsvWO4aeOP0QdL1oUWNStwI1iInODMPVvEMz/y
	uR/rMULmG37jN1B73PMrnT8eo2zSp0/E=
X-Gm-Gg: ASbGnctkxbfL5tI+K2HxCTHXU5KvHLYcXXI0NRnRXoTnbSOCM3Oa3gqo0iYleoffqSn
	d6cpL5El3+48I6Wztyh4/YLFp7q7JXAmQXDtox3PfsIbn0SPWsJVg18Ja1//JsaCEsFAG9GADyd
	aWaxfKoxnQXkytHaJrxVzxx4/ETAvrRdDqfhNICg7jp9L3yc3fTIZ7anHXM9IUn+m5zwq+wE/+E
	Od3U8mOUg3Cm9gKsvhGRj5j4+pgfthWIotp607RPBc9l/NEk5ncLPplFiM=
X-Google-Smtp-Source: AGHT+IE42qiWQSmH4fNgySSy5iZ9HHBA/72mgHfF3UNVKwQsT9p5fpIQne4VWppsxcaB/3va0c6KvWnBKugslZMY2dc=
X-Received: by 2002:a2e:8593:0:b0:375:ffc2:1b2e with SMTP id
 38308e7fff4ca-37797a8d834mr38883871fa.45.1760949103930; Mon, 20 Oct 2025
 01:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAC3nzgJ9uX3rREGQGbLA+oJMzDh0Bc-Fs5sP1sM_4DGScgq=3w@mail.gmail.com>
 <977b67ef-ef6f-4ae4-99db-eeb921a17e3f@broadcom.com> <CAC3nzgJM6azT8T4StreR874h5sUarLH62mgHvRZndV_XEOBEgQ@mail.gmail.com>
 <199fc3250e0.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
 <CAC3nzgJxowTjrJJppahVMg1iLVXad38D5ZR38-rzsDQm8daUTA@mail.gmail.com> <98a614cf-0016-4cb2-9109-84dec84b535f@broadcom.com>
In-Reply-To: <98a614cf-0016-4cb2-9109-84dec84b535f@broadcom.com>
From: Berkem Dincman <berkem.dincman@gmail.com>
Date: Mon, 20 Oct 2025 11:31:30 +0300
X-Gm-Features: AS18NWDQUl5MF1GWw5yZD57LFRBu3h3PcroP7Q0u6GLCcED9z7v2VHC9_U5xVOo
Message-ID: <CAC3nzgJ94L_20hhCbsNu9Unzjg-gDvs-a1x2_vMiarj=wdR6TQ@mail.gmail.com>
Subject: Re: New test release reload driver
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, brcm80211@lists.linux.dev
Content-Type: multipart/mixed; boundary="000000000000cec12a064192e907"

--000000000000cec12a064192e907
Content-Type: multipart/alternative; boundary="000000000000cec129064192e905"

--000000000000cec129064192e905
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

20 Eki 2025 Pzt 11:16 tarihinde Arend van Spriel <
arend.vanspriel@broadcom.com> =C5=9Funu yazd=C4=B1:

> On 10/19/2025 1:50 PM, Berkem Dincman wrote:
> >     [ 17.288032] Bluetooth: BNEP socket layer initialized
> >     [ 17.319081] Bluetooth: MGMT ver 1.23
> >     [ 20.068465] brcmfmac: brcmf_sdio_bus_rxctl: resumed on timeout
> >
> >     As Bluetooth resides on the same chip as wifi I find that
> suspicious. I
> >     would like to know what happens when you disable Bluetooth. Can you
> >     test that?
> >
> > No I turned Bluetooth off and restarted the same error messages would b=
e
> > printed onto the screen
>
> Ok. Thanks for testing. What do you mean by "turned Bluetooth off"? I
> want to assure the bluetooth part of the chip is not powered on. This is
> probably not the same as "turned Bluetooth off". Please provide logs for
> each test and/or verification done. It may save going back and forth
> over email.
>
rfkill list all
I observed another thing, the battery was drained overnight this happened
before in the 6.17 series the screen remained black shutting it of with
Ctrl-Alt-Del also would let somethings open in the 6.17-rc7 release there
was a power management patch from Rockchip and the screen started working

>
> Regards,
> Arend
>
>

--000000000000cec129064192e905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote gmail_quote_contai=
ner"><div dir=3D"ltr" class=3D"gmail_attr">20 Eki 2025 Pzt 11:16 tarihinde =
Arend van Spriel &lt;<a href=3D"mailto:arend.vanspriel@broadcom.com">arend.=
vanspriel@broadcom.com</a>&gt; =C5=9Funu yazd=C4=B1:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;=
padding-left:1ex">On 10/19/2025 1:50 PM, Berkem Dincman wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0[ 17.288032] Bluetooth: BNEP socket layer initializ=
ed<br>
&gt;=C2=A0 =C2=A0 =C2=A0[ 17.319081] Bluetooth: MGMT ver 1.23<br>
&gt;=C2=A0 =C2=A0 =C2=A0[ 20.068465] brcmfmac: brcmf_sdio_bus_rxctl: resume=
d on timeout<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0As Bluetooth resides on the same chip as wifi I fin=
d that suspicious. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0would like to know what happens when you disable Bl=
uetooth. Can you<br>
&gt;=C2=A0 =C2=A0 =C2=A0test that?<br>
&gt; <br>
&gt; No I turned Bluetooth off and restarted the same error messages would =
be <br>
&gt; printed onto the screen<br>
<br>
Ok. Thanks for testing. What do you mean by &quot;turned Bluetooth off&quot=
;? I <br>
want to assure the bluetooth part of the chip is not powered on. This is <b=
r>
probably not the same as &quot;turned Bluetooth off&quot;. Please provide l=
ogs for <br>
each test and/or verification done. It may save going back and forth <br>
over email.<br></blockquote></div></div><div dir=3D"auto">rfkill list all</=
div><div dir=3D"auto">I observed another thing, the battery was drained ove=
rnight this happened before in the 6.17 series the screen remained black sh=
utting it of with Ctrl-Alt-Del also would let somethings open in the 6.17-r=
c7 release there was a power management patch from Rockchip and the screen =
started working</div><div dir=3D"auto"><div class=3D"gmail_quote gmail_quot=
e_container"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
Arend<br>
<br>
</blockquote></div></div></div>

--000000000000cec129064192e905--
--000000000000cec12a064192e907
Content-Type: text/plain; charset="US-ASCII"; name="devices_112749.txt"
Content-Disposition: attachment; filename="devices_112749.txt"
Content-Transfer-Encoding: base64
Content-ID: <19a00bbbcd9beed38ce1>
X-Attachment-Id: 19a00bbbcd9beed38ce1

MDogaGNpMDogQmx1ZXRvb3RoCglTb2Z0IGJsb2NrZWQ6IHllcwoJSGFyZCBibG9ja2VkOiBubwox
OiBwaHkwOiBXaXJlbGVzcyBMQU4KCVNvZnQgYmxvY2tlZDogbm8KCUhhcmQgYmxvY2tlZDogbm8K
--000000000000cec12a064192e907--
