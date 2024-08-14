Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5151415FD01
	for <brcm80211@lists.linux.dev>; Wed, 14 Aug 2024 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723628933; cv=none; b=g2jQK7dLGcd1xT2uWorNOu2ZgmvlCFPuqRUzyz6Yftw9Pv/6mYi0m37x2jESZVNdPRu6DGQNBRR0FVdOWILFxVbSsVSHipl7Z5vdLtfW+7Im1Y/rKOBKkeRPo+wNPelXJwZUAL7XDr11PC3njCM76CseCV/hUddVFkXWeOufzsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723628933; c=relaxed/simple;
	bh=n7denkbqhgALgUseHii2av+n0Qsgr2MUbPt4EdOcoJY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i0E22aPB8j7eZr84Yt083WZlHirb4c1RqFnF4DuJHrnnIDcok1tju8R2NczAiHmnIbUggTiSFK1xB9iNgF4WExC3wDQNoxj0TZRPktZShQYuQaKBPRQbfmunAXam1s+Zb0QNmnN+PdK1V1MCVCxRLXoV2Dfr6QxWJKZlyJxfCLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V6D408zj; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V6D408zj"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-44fe9aa3bfaso37399681cf.0
        for <brcm80211@lists.linux.dev>; Wed, 14 Aug 2024 02:48:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723628930; x=1724233730; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7E9dz5B79iMiE9YR//5bouzEa+H1xHgYZ6HkutyLa1Y=;
        b=V6D408zj2mK83Zbf5mCMVDy8YmFwHnLEwqf/FI+O9cPquPSFGxP2aOWfUI4Yu97Vh0
         qbxgl0VGJ3T+m3TuPtxVEcrXzvlv4JrCT+kRyjKERQhKgi4f7y+7QMG6DmPPHFhALPDv
         v2YIa9cmkes1wu2/4VPNaIopNUgFXe6HfabYnf37ICyBF517QUQped1j+pLxrMUkyqHt
         fAqSuDK5cZ0dwR/YnfX/uu60AEqIDWUOBIUB3b6qBgwIJ41qvJO8cdwTFLOSTDNsmnuo
         muaVD/wiKaO+WsAXjJ16QeB5ljQ0hkEY4PM7tTnsU6KqPKOUZ7AdZkGb9/jk1dK5ZKkV
         wkNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723628930; x=1724233730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7E9dz5B79iMiE9YR//5bouzEa+H1xHgYZ6HkutyLa1Y=;
        b=GgtJjaKBaj82xVs2Gl7F0stfL5S1FPJkty65V1QozJldR2kijWn+vFbP2ET+Q4nDmb
         1ECZ1o9z2L6lNSU/yTcDilGHa3L4KqnB1r98M+sDXLW0HAhTbRRFFqsyny7vjDysqozD
         /WKbgshW+ljoGcYRMwjIpUvgthFk4OwSwQS11cDqJqndtMzrmLo6qitMTUQFgb0MVpwe
         vB3f/o4l01vMxeMVMYOSo8dh1buKwxcBCt33KqOj9fQBx00zVwClpbC61rS1y4NglvXW
         VTIi8rAR3bDpKRpKYCCPhIG87SFeskHyVmX9s7NB5vMGUKVuEGKbHut8a10vGRnivqdt
         /Zhw==
X-Forwarded-Encrypted: i=1; AJvYcCVa3NXNi5gpdCOzXGaHFprQHRcx3Tp9K7oedsptl0mEMX8Ad7jEQhjiE0kDPwW7aZPo9TGr/9/TOG2Qzo+wBmlJlVMnM2F1jFz0
X-Gm-Message-State: AOJu0Yy74/307jjhQqahdstZl8azy10lhZczYh7wgNc7gIFHJzz8Mdty
	SEC5HZNvu8y/q81yHF5cYez1u8zEsZe54+BtldAXSNV7Q6g4SEpjKguY/+jb2mjkvow6xNeJmaG
	F5tGwukfffcIbQKHKSV0iXwMFe30=
X-Google-Smtp-Source: AGHT+IHHkrK7mmSRX+NFljHlJety4di7IkukkrNgDqvQHopRybi91eO1UnO/AUVkPQhhdbCRrGEPu+h2HKURrxKNdnc=
X-Received: by 2002:a05:622a:40cc:b0:447:e562:b6b with SMTP id
 d75a77b69052e-4535bbd981fmr26069981cf.64.1723628930043; Wed, 14 Aug 2024
 02:48:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240813082007.2625841-1-jacobe.zang@wesion.com>
 <20240813082007.2625841-5-jacobe.zang@wesion.com> <721da64c-42ec-4be6-8ad3-e2685a84823a@broadcom.com>
 <2269063.vFx2qVVIhK@latitude-fedora> <fa019ee9-3f4d-4bea-92a7-929713518dc9@wesion.com>
In-Reply-To: <fa019ee9-3f4d-4bea-92a7-929713518dc9@wesion.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 14 Aug 2024 12:48:39 +0300
Message-ID: <CABjd4YwTbG8pm_xwrOVtVwMwvarvz2SB9bapH3LDMqPn6pH9Ew@mail.gmail.com>
Subject: Re: [PATCH v10 4/5] wifi: brcmfmac: Add optional lpo clock enable support
To: Jacobe Zang <jacobe.zang@wesion.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, heiko@sntech.de, kvalo@kernel.org, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	conor+dt@kernel.org, linux-rockchip@lists.infradead.org, 
	efectn@protonmail.com, dsimic@manjaro.org, jagan@edgeble.ai, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, arend@broadcom.com, 
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org, megi@xff.cz, 
	duoming@zju.edu.cn, bhelgaas@google.com, minipli@grsecurity.net, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	nick@khadas.com, Sai Krishna <saikrishnag@marvell.com>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 12:27=E2=80=AFPM Jacobe Zang <jacobe.zang@wesion.co=
m> wrote:
>
>
>
> On 2024/8/14 16:47, Alexey Charkov wrote:
> > Hi Arend, Jacobe,
> >
> > On Tuesday, August 13, 2024 2:57:28=E2=80=AFPM GMT+3 Arend van Spriel w=
rote:
> >> On 8/13/2024 10:20 AM, Jacobe Zang wrote:
> >>> WiFi modules often require 32kHz clock to function. Add support to
> >>> enable the clock to PCIe driver and move "brcm,bcm4329-fmac" check
> >>> to the top of brcmf_of_probe. Change function prototypes from void
> >>> to int and add appropriate errno's for return values that will be
> >>> send to bus when error occurred.
> >>
> >> I was going to say it looks good to me, but....
> >>
> >>> Co-developed-by: Ondrej Jirman <megi@xff.cz>
> >>> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> >>> Co-developed-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> >>> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> >>> Reviewed-by: Sai Krishna <saikrishnag@marvell.com>
> >>> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> >>> ---
> >>>
> >>>    .../broadcom/brcm80211/brcmfmac/bcmsdh.c      |  4 +-
> >>>    .../broadcom/brcm80211/brcmfmac/common.c      |  3 +-
> >>>    .../wireless/broadcom/brcm80211/brcmfmac/of.c | 53 +++++++++++----=
----
> >>>    .../wireless/broadcom/brcm80211/brcmfmac/of.h |  9 ++--
> >>>    .../broadcom/brcm80211/brcmfmac/pcie.c        |  3 ++
> >>>    .../broadcom/brcm80211/brcmfmac/sdio.c        | 22 +++++---
> >>>    .../broadcom/brcm80211/brcmfmac/usb.c         |  3 ++
> >>>    7 files changed, 61 insertions(+), 36 deletions(-)
> >>
> >> [...]
> >>
> >>> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> >>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c index
> >>> e406e11481a62..f19dc7355e0e8 100644
> >>> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> >>> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> >>
> >> [...]
> >>
> >>> @@ -113,33 +118,39 @@ void brcmf_of_probe(struct device *dev, enum
> >>> brcmf_bus_type bus_type,>
> >>>             of_node_put(root);
> >>>
> >>>     }
> >>>
> >>> -   if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
> >>> -           return;
> >>> -
> >>>
> >>>     err =3D brcmf_of_get_country_codes(dev, settings);
> >>>     if (err)
> >>>
> >>>             brcmf_err("failed to get OF country code map (err=3D%d)
> > \n", err);
> >>>
> >>>     of_get_mac_address(np, settings->mac);
> >>>
> >>> -   if (bus_type !=3D BRCMF_BUSTYPE_SDIO)
> >>> -           return;
> >>> +   if (bus_type =3D=3D BRCMF_BUSTYPE_SDIO) {
> >>
> >> Don't like the fact that this now has an extra indentation level and i=
t
> >> offers no extra benefit. Just keep the original if-statement and retur=
n
> >> 0. Consequently the LPO clock code should move just before the if-stat=
ement.
> >>> +           if (of_property_read_u32(np, "brcm,drive-strength",
> > &val) =3D=3D 0)
> >>> +                   sdio->drive_strength =3D val;
> >>>
> >>> -   if (of_property_read_u32(np, "brcm,drive-strength", &val) =3D=3D =
0)
> >>> -           sdio->drive_strength =3D val;
> >>> +           /* make sure there are interrupts defined in the node */
> >>> +           if (!of_property_present(np, "interrupts"))
> >>> +                   return 0;
> >>>
> >>> -   /* make sure there are interrupts defined in the node */
> >>> -   if (!of_property_present(np, "interrupts"))
> >>> -           return;
> >>> +           irq =3D irq_of_parse_and_map(np, 0);
> >>> +           if (!irq) {
> >>> +                   brcmf_err("interrupt could not be
> > mapped\n");
> >>> +                   return 0;
> >>> +           }
> >>> +           irqf =3D irqd_get_trigger_type(irq_get_irq_data(irq));
> >>> +
> >>> +           sdio->oob_irq_supported =3D true;
> >>> +           sdio->oob_irq_nr =3D irq;
> >>> +           sdio->oob_irq_flags =3D irqf;
> >>> +   }
> >>>
> >>> -   irq =3D irq_of_parse_and_map(np, 0);
> >>> -   if (!irq) {
> >>> -           brcmf_err("interrupt could not be mapped\n");
> >>> -           return;
> >>> +   clk =3D devm_clk_get_optional_enabled(dev, "lpo");
> >>> +   if (!IS_ERR_OR_NULL(clk)) {
> >>> +           brcmf_dbg(INFO, "enabling 32kHz clock\n");
> >>> +           return clk_set_rate(clk, 32768);
> >>> +   } else {
> >>> +           return PTR_ERR_OR_ZERO(clk);
> >>>
> >>>     }
> >>
> >> Change this to:
> >>   > +        clk =3D devm_clk_get_optional_enabled(dev, "lpo");
> >>   > +        if (IS_ERR_OR_NULL(clk)) {
> >>   > +                return PTR_ERR_OR_ZERO(clk);
> >
> > Perhaps in this case we should go for IS_ERR and PTR_ERR respectively.
> > devm_clk_get_optional_enabled would return NULL when the optional clock=
 is not
> > found, so NULL is not an error state but serves as a dummy clock that c=
an be> used with clk_set_rate.
>
> I think we don't need to set clock rate for clock is NULL. So it should
> be changed to:
>
> +       clk =3D devm_clk_get_optional_enabled(dev, "lpo");
> +       if (IS_ERR(clk)) {
> +               return PTR_ERR(clk);
> +       } else if (clk) {
> +               brcmf_dbg(INFO, "enabling 32kHz clock\n");
> +               clk_set_rate(clk, 32768);
> +       }

If clk is NULL then clk_set_rate returns immediately with status zero,
so there is little difference from whether you wrap it into another if
(clk) or not. You can probably drop the debug statement altogether and
call clk_set_rate unconditionally - this will look neater.

Best regards,
Alexey
