Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B540F1AA3EC
	for <brcm80211@lists.linux.dev>; Wed, 31 Jul 2024 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722427316; cv=none; b=qRG+xE6hXfunlqNTIg9CVkzyLQH5nasprLnge12NpLWp8BaXFYocn91PGlwX0/RyUsgf7f6m4tg0+Cgqaavo5+XFBas1yMtmYuQcyO2PEnaENVR7DloDFAgq42kh7JPdYY0ADfD7l1ZysilX1ntjVhT/QFLG9+INUw7XC593n4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722427316; c=relaxed/simple;
	bh=LVjov7ClVWhHYmB27oJpJCKYTDKiwHUtuAGM7drOpZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XGqANUjglLRE3/mxpSVCzT+yrTMQhmjge4nTX9AeM6K+N0yZbpx6jltLW6nlqkjZnjwFvGGTOKTj4Xknonkh9Y5HlZuvxkD/K7K02SdAkuSWmXS/I4bTf9hz87fZaVnMpu0PasW/lzQJekP7pg0ps7Leka4gA4BTST0MCBfo7II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HkDE2QSL; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HkDE2QSL"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-45019dccc3aso22888371cf.1
        for <brcm80211@lists.linux.dev>; Wed, 31 Jul 2024 05:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722427313; x=1723032113; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DdxVctv+DdSXKhp2nW8V2B7yfwAa9gWaT7Efbbf2MUs=;
        b=HkDE2QSL4Ngx6ItlFXCpydoVG/yy14iFjcrMByRZnuBwgSjWO0sKTSZMH085PQ/uo4
         fMROozQXcUoKd8NLfFQjqKU4HMubKIe1+RJOnY3UCDJuLKuLkBEKsOt4XDjpGyDKIisW
         cFNMvJ8husyBDQIanyzZr8Zpx2vm8Pe/DWnlJV8neryoQ/9yDD4UE8XVOAS4If3n+c/B
         qCMqHC2Psv0g2GkgIcX67EDY1/XXJ1bv4tdF13A6h/Gwv5Ss9D7eiVf2fcxq05pMsCJe
         Pmjr9GUe3ONFJi6luRpenRNX3dCLp8xXf+HGZs8CEBOl1StZx0RznTyfc40pXs3EaPOh
         dn6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722427313; x=1723032113;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdxVctv+DdSXKhp2nW8V2B7yfwAa9gWaT7Efbbf2MUs=;
        b=a/I+4Dx6pVzIvDC6ZGuphNY2/ukH0qs51INYRCf4RQ4jyYYhSsz51nHXGzcWnJQ5qA
         +K/Qr5oF9yqpEd0CrV32GYFqGPqJ8ShfcsW3mO36KmEj3M8JfWx9Ja4sao1DX1W9Djs9
         +BQb92ubUiF6e1FsmZ6y3JPv2zyPf36u3mhf0nThMBJb6wSGHA2htB1XgWbtfp8bdIq0
         Ixod1OKmifNHIQ5CZFfGJEVwMe90caIDlnAmhBB4F1QN0FCQOGuliVofsGMDAdpy9FqZ
         D0nzBoDnchZ3yIUbGF3YSDXPWsBrxohlmAP1YwTAPJEyTw7uG4xHtbCJO4FFx1j8SFmE
         2vXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6gFoAxtYZKz+wBH8nIsKPWty8/0FqUe3syuz47KD/zYjWJnCupfHJVVoK4FoLACBfqVeh1p3+NfsXmqDLeP0n/PDZkTaec5IP
X-Gm-Message-State: AOJu0YzmGTcnZWQO6jP+wDRjvdV5dpfsGxAszN6YsJt07aCSLlwPKVQb
	hcDoDDgNrCDEkzYard2PwlmW07xYAH6yomJmWxYjrDpNQJdftViRuEKyMTXM+UlZzohAx8ybgKn
	+tYaB2bYdRYZ/jtTUkQ3PHgjakkk=
X-Google-Smtp-Source: AGHT+IFi2BbcxJpNlMrpYMLQzS7Jo6R2My/hEHuRqvwqwW1vOU0rinmMmWgsYL/ghObViGzEfNFNw52JVfzra3ViMP4=
X-Received: by 2002:ac8:5806:0:b0:44f:f9ce:25df with SMTP id
 d75a77b69052e-45004f4bf36mr164398711cf.46.1722427313075; Wed, 31 Jul 2024
 05:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240731061132.703368-1-jacobe.zang@wesion.com>
 <20240731061132.703368-5-jacobe.zang@wesion.com> <0a78a0fb-0a5e-424f-a801-4a63b9ee1a49@gmail.com>
 <3ded8aea-ee11-43da-9dd7-1259cf931747@broadcom.com>
In-Reply-To: <3ded8aea-ee11-43da-9dd7-1259cf931747@broadcom.com>
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 31 Jul 2024 15:01:41 +0300
Message-ID: <CABjd4YxiSY0A0iVHGHw9RDey+avxmzUapoLLLyf=80MzVX0yWA@mail.gmail.com>
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

On Wed, Jul 31, 2024 at 2:15=E2=80=AFPM Arend van Spriel
<arend.vanspriel@broadcom.com> wrote:
>
> On 7/31/2024 12:16 PM, Alexey Charkov wrote:
> > Hi Jacobe,
> >
> >
> > On 31/07/2024 9:11 am, Jacobe Zang wrote:
> >  > WiFi modules often require 32kHz clock to function. Add support to
> >  > enable the clock to PCIe driver and move "brcm,bcm4329-fmac" check
> >  > to the top of brcmf_of_probe
> >  >
> >  > Co-developed-by: Ondrej Jirman <megi@xff.cz>
> >  > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> >  > Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> >  > ---
> >  >  .../net/wireless/broadcom/brcm80211/brcmfmac/of.c    | 12 +++++++++=
++-
> >  >  1 file changed, 11 insertions(+), 1 deletion(-)
> >  >
> >  > diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> > b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> >  > index e406e11481a62..7e0a2ad5c7c8a 100644
> >  > --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> >  > +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> >  > @@ -6,6 +6,7 @@
> >  >  #include <linux/of.h>
> >  >  #include <linux/of_irq.h>
> >  >  #include <linux/of_net.h>
> >  > +#include <linux/clk.h>
> >  >
> >  >  #include <defs.h>
> >  >  #include "debug.h"
> >  > @@ -70,12 +71,16 @@ void brcmf_of_probe(struct device *dev, enum
> > brcmf_bus_type bus_type,
> >  >  {
> >  >      struct brcmfmac_sdio_pd *sdio =3D &settings->bus.sdio;
> >  >      struct device_node *root, *np =3D dev->of_node;
> >  > +    struct clk *clk;
> >  >      const char *prop;
> >  >      int irq;
> >  >      int err;
> >  >      u32 irqf;
> >  >      u32 val;
> >  >
> >  > +    if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
> >  > +        return;
> >
> > Did you test this? The DTS patch you sent as part of this series doesn'=
t
> > list "brcm,bcm4329-fmac" in the compatible, so this will probably retur=
n
> > right here, skipping over the rest of your patch.
> >
> > Please test before resending, both with and without the driver for the
> > Bluetooth part of the chip (since it also touches clocks).
> >
> > You are also changing the behavior for other systems by putting this
> > check further up the probe path, which might break things for no reason=
.
> > Better put your clk-related addition below where this check was
> > originally, rather than reorder stuff you don't have to reorder.
>
> That was upon my suggestion. That check was originally at the top of the
> function, but people added stuff before that. I agree that makes the
> compatible "brcm,brcm4329-fmac" required which is what the textual
> binding stated before the switch to YAML was made:
>
> """
> Broadcom BCM43xx Fullmac wireless SDIO devices
>
> This node provides properties for controlling the Broadcom wireless
> device. The
> node is expected to be specified as a child node to the SDIO controller t=
hat
> connects the device to the system.
>
> Required properties:
>
>   - compatible : Should be "brcm,bcm4329-fmac".
> """
>
> Not sure whether this is still true for YAML version (poor YAML reading
> skills ;-) ), but it should as the switch from textual to YAML should
> not have changed the bindings specification.
>
> >  > +
> >  >      /* Apple ARM64 platforms have their own idea of board type,
> > passed in
> >  >       * via the device tree. They also have an antenna SKU parameter
> >  >       */
> >  > @@ -113,8 +118,13 @@ void brcmf_of_probe(struct device *dev, enum
> > brcmf_bus_type bus_type,
> >  >          of_node_put(root);
> >  >      }
> >  >
> >  > -    if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
> >  > +    clk =3D devm_clk_get_optional_enabled(dev, "lpo");
> >  > +    if (!IS_ERR_OR_NULL(clk)) {
> >  > +        brcmf_dbg(INFO, "enabling 32kHz clock\n");
> >  > +        clk_set_rate(clk, 32768);
> >  > +    } else {
> >  >          return;
> >
> > Why return here? If the clock is optional, a lot of systems will not
> > have it - that shouldn't prevent the driver from probing. And you are
> > still not handling the -EPROBE_DEFER case which was mentioned on your
> > previous submission.
>
> Right. The else statement above could/should be:
>
> } else if (clk && PTR_ERR(clk) =3D=3D -EPROBE_DEFER) {
>          return PTR_ERR(clk);
> }

... plus change the function prototype to return int and propagate
that error code through brcmf_get_module_param to brcmf_pcie_probe's
return value. I guess checking clk for NULL is also redundant in this
case?

Best,
Alexey
