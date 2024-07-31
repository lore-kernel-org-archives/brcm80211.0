Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 112471B0139
	for <brcm80211@lists.linux.dev>; Wed, 31 Jul 2024 12:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722430592; cv=none; b=eTS2/xSCWu69N2hAjMR1rpK0PwLvdcV/2sH7Rc84GUtbb1O4/0ivjQ6tgMZ3srrj+sPhVD6Ukdga1X9wLaQ7/WeSX5ysn4a52z/uMutygM01Lyz+/7UNt1i55lteGL+x0fNdfv7PHkR7PiRpZbYNcyxLhX6ykE1t/EI0gcva75w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722430592; c=relaxed/simple;
	bh=ReKHMmunPvE+vcGTa+O4hLPOMROj0UD+UoMrTRavCqU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqHOpBTp/84E/qYkP+d+FKbTZv3Z+p6iVKSbl5BjusM0L3LnF2fFI6sS1GshlxpYPHdVPBDYYTSfyAF0VSAmPmtzifnpsMkb/F2M6MjKSDsuIEzY31VBjo0l2VWKrAFPRXPFUha9Ry+7e9fDDMCC/GWgUKEEZrfAnYla58OckpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QfvXWQCe; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QfvXWQCe"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-44fedc06c03so29078101cf.3
        for <brcm80211@lists.linux.dev>; Wed, 31 Jul 2024 05:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722430590; x=1723035390; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1seQq6pVWKt421meYywLs/KfxY3tgGQZFmNZ1IQhRhU=;
        b=QfvXWQCe8TDqyS4n1Nnx0DhclbdaYgqbKYs2f4B9PHLbbLyrpAbcfBws4TZjp1MO7A
         HXp1XD88oONs0QSRnqzh4WCpngHdk7qDDy7axwWYS0MlAJIkbNUS7Pg7p3Di92OCf90Q
         D/UZ5jNVx7PZxISmZaSbtg2jfmvscASkcrNae+XGe3aqj6QypibaIMfvOAPuQHYb1khm
         QPjq5jZqqCCrRSL88ugB5mTOaIoccJY8ZpfGwxwVY6cF65KNsKmJJPMOjaeK5M6E3DNO
         ngc6wUKtZ9v1MFlfuvEwqR/SE/jtKci1odjtC4e+vTsksuwDYemxD/fF/QDRQMSZP5ge
         cxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722430590; x=1723035390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1seQq6pVWKt421meYywLs/KfxY3tgGQZFmNZ1IQhRhU=;
        b=AkVgfuUUyBfmX9U5Z/IHLDxzT2N9ObSrsHC7glGC+ufzOJdYxtQ75qAz3IhapCvPLr
         mVrYW+obSRQm1PzR9+nHkqqlcA+FDNW62+Se6Eu8/i5/ChaVxzcmPdG5EVexdH4Fppgi
         0xPZ+/6HxF2h3h6RpNcpnqfagf0a5yyhBpahySMn36yqMVneGxTrfdZ8Bw80ymIduJot
         f18mKKBTqg23MMiOxZrFqu2uKmwBc+8mYFF2OJRWrEoJpWG0byxThNLUnYel5Xm+JekB
         1bDTn/pXHEfsIqiwydDfodNjUW+a4olbvv5I+R4jmt3nNjJsDlr0fyANYU7HC/tgp5dE
         G4Lw==
X-Forwarded-Encrypted: i=1; AJvYcCWFhFsJYCH6jyqiigkQDF4lK+iW9fMajAFC//d/em8kx6kgi6+atPMmbpcle92EZpwzrPgQ2d3e9r25f9S452dwYO6kuZAna7Sp
X-Gm-Message-State: AOJu0YyeILWEHMbbZ+biZoGaYK4s0N/no4avV2XmQgOVxydRv+jMXFB+
	OCrKXvIzy4pltQsH0uskAQrR3ajEz4hT2maNJAx5+nGXUM8o0xAViQM2+F5An3gh2NZ/ShrNv7a
	n6v4MWGcP0/tac0Xc4Scmwiv7DMM=
X-Google-Smtp-Source: AGHT+IHjDtpIf0QCPWYz+XhMAa8yvBe/ManCTONa09BmUisSVpzkusuCKuxED1ndPBdlxCf66ZyqBkZoqGckyZQwO10=
X-Received: by 2002:ac8:7d10:0:b0:447:f469:b58d with SMTP id
 d75a77b69052e-45004f4e214mr187667771cf.42.1722430589901; Wed, 31 Jul 2024
 05:56:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731061132.703368-1-jacobe.zang@wesion.com>
 <20240731061132.703368-5-jacobe.zang@wesion.com> <0a78a0fb-0a5e-424f-a801-4a63b9ee1a49@gmail.com>
 <3ded8aea-ee11-43da-9dd7-1259cf931747@broadcom.com> <CABjd4YxiSY0A0iVHGHw9RDey+avxmzUapoLLLyf=80MzVX0yWA@mail.gmail.com>
 <6e34c814-a6dc-4a96-9e46-ca25af67f4f6@broadcom.com>
In-Reply-To: <6e34c814-a6dc-4a96-9e46-ca25af67f4f6@broadcom.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 31 Jul 2024 15:56:18 +0300
Message-ID: <CABjd4YxdCh7EceYOfcFxKtV0H7Von0oZAMWD=69sM6y4-CoAQw@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] wifi: brcmfmac: Add optional lpo clock enable support
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Jacobe Zang <jacobe.zang@wesion.com>, robh@kernel.org, krzk+dt@kernel.org, 
	heiko@sntech.de, kvalo@kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, conor+dt@kernel.org, 
	efectn@protonmail.com, dsimic@manjaro.org, jagan@edgeble.ai, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	arend@broadcom.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, 
	megi@xff.cz, duoming@zju.edu.cn, bhelgaas@google.com, minipli@grsecurity.net, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	nick@khadas.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 31, 2024 at 3:32=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 7/31/2024 2:01 PM, Alexey Charkov wrote:
> > On Wed, Jul 31, 2024 at 2:15=E2=80=AFPM Arend van Spriel
> > <arend.vanspriel@broadcom.com> wrote:
> >>
> >> On 7/31/2024 12:16 PM, Alexey Charkov wrote:
> >>> Hi Jacobe,
> >>>
> >>>
> >>> On 31/07/2024 9:11 am, Jacobe Zang wrote:
> >>>   > WiFi modules often require 32kHz clock to function. Add support t=
o
> >>>   > enable the clock to PCIe driver and move "brcm,bcm4329-fmac" chec=
k
> >>>   > to the top of brcmf_of_probe
> >>>   >
> >>>   > Co-developed-by: Ondrej Jirman <megi@xff.cz>
> >>>   > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> >>>   > Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> >>>   > ---
> >>>   >  .../net/wireless/broadcom/brcm80211/brcmfmac/of.c    | 12 ++++++=
+++++-
> >>>   >  1 file changed, 11 insertions(+), 1 deletion(-)
> >>>   >
> >>>   > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.=
c
> >>> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> >>>   > index e406e11481a62..7e0a2ad5c7c8a 100644
> >>>   > --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> >>>   > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> >>>   > @@ -6,6 +6,7 @@
> >>>   >  #include <linux/of.h>
> >>>   >  #include <linux/of_irq.h>
> >>>   >  #include <linux/of_net.h>
> >>>   > +#include <linux/clk.h>
> >>>   >
> >>>   >  #include <defs.h>
> >>>   >  #include "debug.h"
> >>>   > @@ -70,12 +71,16 @@ void brcmf_of_probe(struct device *dev, enum
> >>> brcmf_bus_type bus_type,
> >>>   >  {
> >>>   >      struct brcmfmac_sdio_pd *sdio =3D &settings->bus.sdio;
> >>>   >      struct device_node *root, *np =3D dev->of_node;
> >>>   > +    struct clk *clk;
> >>>   >      const char *prop;
> >>>   >      int irq;
> >>>   >      int err;
> >>>   >      u32 irqf;
> >>>   >      u32 val;
> >>>   >
> >>>   > +    if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac")=
)
> >>>   > +        return;
> >>>
> >>> Did you test this? The DTS patch you sent as part of this series does=
n't
> >>> list "brcm,bcm4329-fmac" in the compatible, so this will probably ret=
urn
> >>> right here, skipping over the rest of your patch.
> >>>
> >>> Please test before resending, both with and without the driver for th=
e
> >>> Bluetooth part of the chip (since it also touches clocks).
> >>>
> >>> You are also changing the behavior for other systems by putting this
> >>> check further up the probe path, which might break things for no reas=
on.
> >>> Better put your clk-related addition below where this check was
> >>> originally, rather than reorder stuff you don't have to reorder.
> >>
> >> That was upon my suggestion. That check was originally at the top of t=
he
> >> function, but people added stuff before that. I agree that makes the
> >> compatible "brcm,brcm4329-fmac" required which is what the textual
> >> binding stated before the switch to YAML was made:
> >>
> >> """
> >> Broadcom BCM43xx Fullmac wireless SDIO devices
> >>
> >> This node provides properties for controlling the Broadcom wireless
> >> device. The
> >> node is expected to be specified as a child node to the SDIO controlle=
r that
> >> connects the device to the system.
> >>
> >> Required properties:
> >>
> >>    - compatible : Should be "brcm,bcm4329-fmac".
> >> """
> >>
> >> Not sure whether this is still true for YAML version (poor YAML readin=
g
> >> skills ;-) ), but it should as the switch from textual to YAML should
> >> not have changed the bindings specification.
> >>
> >>>   > +
> >>>   >      /* Apple ARM64 platforms have their own idea of board type,
> >>> passed in
> >>>   >       * via the device tree. They also have an antenna SKU parame=
ter
> >>>   >       */
> >>>   > @@ -113,8 +118,13 @@ void brcmf_of_probe(struct device *dev, enum
> >>> brcmf_bus_type bus_type,
> >>>   >          of_node_put(root);
> >>>   >      }
> >>>   >
> >>>   > -    if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac")=
)
> >>>   > +    clk =3D devm_clk_get_optional_enabled(dev, "lpo");
> >>>   > +    if (!IS_ERR_OR_NULL(clk)) {
> >>>   > +        brcmf_dbg(INFO, "enabling 32kHz clock\n");
> >>>   > +        clk_set_rate(clk, 32768);
> >>>   > +    } else {
> >>>   >          return;
> >>>
> >>> Why return here? If the clock is optional, a lot of systems will not
> >>> have it - that shouldn't prevent the driver from probing. And you are
> >>> still not handling the -EPROBE_DEFER case which was mentioned on your
> >>> previous submission.
> >>
> >> Right. The else statement above could/should be:
> >>
> >> } else if (clk && PTR_ERR(clk) =3D=3D -EPROBE_DEFER) {
> >>           return PTR_ERR(clk);
> >> }
> >
> > ... plus change the function prototype to return int and propagate
> > that error code through brcmf_get_module_param to brcmf_pcie_probe's
> > return value. I guess checking clk for NULL is also redundant in this
> > case?
>
> Only wanted to give the suggestion to get started. Propagating the
> return value seemed obvious to me, but you are absolutely right.
> PTR_ERR(NULL) will probably be something else than -EPROBE_DEFER but it
> seems odd to me. Maybe PTR_ERR_OR_ZERO(clk) is a better option here.

Indeed. Perhaps something along the lines of:

       clk =3D devm_clk_get_optional_enabled(dev, "lpo");
       if (!IS_ERR_OR_NULL(clk)) {
               brcmf_dbg(INFO, "enabling 32kHz clock\n");
               return clk_set_rate(clk, 32768);
       } else {
               return PTR_ERR_OR_ZERO(clk);
       }

... which should then go at the very end of brcmf_of_probe. And all of
the existing void returns should get appropriate errno's. And the
functions prototypes should be updated along the call chain. And then
it would still only work after pwrseq is added to ensure that power
and wake signals are applied correctly along with this clock, as
Sebastian pointed out in the other thread :)

Which really prompts a question: should this clock be added to the
PCIe driver and the respective DT binding in the first place, or
should it instead be claimed by pwrseq, leaving brcmfmac alone?

Best regards,
Alexey
