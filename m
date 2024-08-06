Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B85176FB0
	for <brcm80211@lists.linux.dev>; Tue,  6 Aug 2024 23:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722985815; cv=none; b=DrWYQGkBc7OQmjLbBOO2hvtzaAb5i6YFqBAmbJCw5rioz2BSFL1B/dtHjjSVKB+NPZ3tWV2CEn61QaBbKvxhXMA3nwzzL22ODXywU46zMl9xMq8p8bWj5De+JoBjAUb9QdMU3BgU+i7gnWLK7jNlhRsR58N/V98RdnfZ1q5PF4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722985815; c=relaxed/simple;
	bh=Qf6+JdxjTOnoRUBGEbodJwQ7eJNf0ivS5hQCeSVQXZc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oonbjd4Gbq+cucyzf07c7P4e/yjARp7DaXBlwqePZSet5ybB3SM1wzcEa7t2ktxYfeBlCKHYY3Mk4jcUgD0B0CY5JKxxMZ15bMo5Ofqt7NQ1H5b89kaZrPbs8xRxcWYpEjgcMnBtK3b7fZAmN+kS309PpMq+x/w6Ok6xsqDnR4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFfrRKpW; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFfrRKpW"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f149845d81so14613171fa.0
        for <brcm80211@lists.linux.dev>; Tue, 06 Aug 2024 16:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722985810; x=1723590610; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3BKACjifm4zlJzrEKsrZ7Wm5mri4Uy3NlfpdbimrVeQ=;
        b=kFfrRKpWEeGFHiW/YLmvZ0fYHJHTBmpF7D6/3zeq+moVAgEQS13MA0cqGuZvyfhLHo
         h7yYA2zExr7TEQBJB0smd1dcZc7mhMlykDG0qiN7N3KG3QDw/fOrew7ur9Abb4/LyaoS
         oFqB9BCSTcSY+E4X+tCUGYcxMGX+jESDjt8mN66mOTXqSk76i/ssLTnPlYfEKY8isgYz
         NyH8+pwCOnn3JURxxdkO379Yn2LZn45fyEtJwxNR4FDMmrDNd/gZksAKM3BWeZp42qsI
         +TgiYIMLrR5PfFYhr+oqsMHXcZia5ip7H02pgq0EzRiIeFTLdD9dLrLDAhLS0yDMayCf
         nUFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722985810; x=1723590610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3BKACjifm4zlJzrEKsrZ7Wm5mri4Uy3NlfpdbimrVeQ=;
        b=wZOJadMxosyNTMdJDPpudkRSzcmYnoQgO+6zOlZC6KNho886iI7vt7jlVn4VbGMBIn
         fE1+eCivUNfNVgIT7EeHv3b9cJ12AJWvtEEImcfOGk98ByBQTcqQMNAFq5GG0Z8H8QS1
         b36C7MwwTl44WorMQemMwd2VePxOLiopn7Dvoi33/7JVuowi+jl5vUVkohf3V3vpe1bn
         lxKXO2XZUusiYrLR44772HmG8KdLz7LMKrUJwpjlJeVsnJsH/YFUMAa/lBscEfH1A34q
         bX4P69pB84xOJEhrGpjA9Lg2aLfllyNhHC1okt3yuc4jLMr06r2Y7sgz/9VD5hZq2bIa
         cO+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUsgE55qBI6+/xRWN52fpRGI9YD8rHSmC51YTbI15VA2AUXuTHybkfE6uSs2Pn9k73VuZSVKPxLm49ZMUhez/seqgox3HnX3i2o
X-Gm-Message-State: AOJu0YxAclQVzaVv1+8fI0hBAk/zfwb4eMDEyjq+LL6AaPzq1Ljtr08R
	u3/YnFVfwA5ncmqCQxu2U9usWeUevNTdq3Z848e7B+4z6cJDND/U
X-Google-Smtp-Source: AGHT+IH1IDUX/E2a9IMuptV/iccaNx9WmZvl3qI21Sp6hM167FBjhC6RR0DjKYp4VWYMwsWmwhqZrg==
X-Received: by 2002:a2e:320e:0:b0:2ef:206c:37c4 with SMTP id 38308e7fff4ca-2f15ab0bf8fmr114974771fa.33.1722985809610;
        Tue, 06 Aug 2024 16:10:09 -0700 (PDT)
Received: from [10.42.0.74] ([176.59.40.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f16a656b1fsm14289261fa.92.2024.08.06.16.10.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Aug 2024 16:10:08 -0700 (PDT)
Message-ID: <2e38c2bd-2cb2-4104-97ad-0355069606c0@gmail.com>
Date: Wed, 7 Aug 2024 02:10:06 +0300
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 4/5] wifi: brcmfmac: Add optional lpo clock enable
 support
To: Jacobe Zang <jacobe.zang@wesion.com>, robh@kernel.org,
 krzk+dt@kernel.org, heiko@sntech.de, kvalo@kernel.org, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 conor+dt@kernel.org, arend.vanspriel@broadcom.com
Cc: efectn@protonmail.com, dsimic@manjaro.org, jagan@edgeble.ai,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 arend@broadcom.com, linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 megi@xff.cz, duoming@zju.edu.cn, bhelgaas@google.com,
 minipli@grsecurity.net, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, nick@khadas.com
References: <20240805073425.3492078-1-jacobe.zang@wesion.com>
 <20240805073425.3492078-5-jacobe.zang@wesion.com>
Content-Language: en-US
From: Alexey Charkov <alchark@gmail.com>
In-Reply-To: <20240805073425.3492078-5-jacobe.zang@wesion.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jacobe,

On 05/08/2024 10:34 am, Jacobe Zang wrote:
> WiFi modules often require 32kHz clock to function. Add support to
> enable the clock to PCIe driver and move "brcm,bcm4329-fmac" check
> to the top of brcmf_of_probe. Change function prototypes from void
> to int and add appropriate errno's for return values that will be
> send to bus when error occurred.
> 
> Co-developed-by: Ondrej Jirman <megi@xff.cz>
> Signed-off-by: Ondrej Jirman <megi@xff.cz>
> Co-developed-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
> Signed-off-by: Jacobe Zang <jacobe.zang@wesion.com>
> ---
>   .../broadcom/brcm80211/brcmfmac/bcmsdh.c      |  4 +++
>   .../broadcom/brcm80211/brcmfmac/common.c      |  6 +++-
>   .../wireless/broadcom/brcm80211/brcmfmac/of.c | 28 +++++++++++++------
>   .../wireless/broadcom/brcm80211/brcmfmac/of.h |  9 +++---
>   .../broadcom/brcm80211/brcmfmac/pcie.c        |  3 ++
>   .../broadcom/brcm80211/brcmfmac/sdio.c        | 18 ++++++++----
>   .../broadcom/brcm80211/brcmfmac/usb.c         |  3 ++
>   7 files changed, 52 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
> index 13391c2d82aae..ee3ca85c4a47b 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
> @@ -951,6 +951,10 @@ int brcmf_sdiod_probe(struct brcmf_sdio_dev *sdiodev)
>   		ret = -ENODEV;
>   		goto out;
>   	}
> +	if (IS_ERR(sdiodev->bus)) {
> +		ret = PTR_ERR(sdiodev->bus);
> +		goto out;
> +	}

Maybe return -ENODEV error pointer instead of NULL from brcmf_sdio_probe 
as the default for the fail path? Then you can condense these two checks 
into one

>   	brcmf_sdiod_host_fixup(sdiodev->func2->card->host);
>   out:
>   	if (ret)
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
> index b24faae35873d..6c5d26f9b7661 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/common.c
> @@ -561,8 +561,12 @@ struct brcmf_mp_device *brcmf_get_module_param(struct device *dev,
>   	if (!found) {
>   		/* No platform data for this device, try OF and DMI data */
>   		brcmf_dmi_probe(settings, chip, chiprev);
> -		brcmf_of_probe(dev, bus_type, settings);
>   		brcmf_acpi_probe(dev, bus_type, settings);
> +		i = brcmf_of_probe(dev, bus_type, settings);
> +		if (i < 0) {
> +			kfree(settings);
> +			settings = ERR_PTR(i);
> +		}

This looks wrong. First, you're calling brcmf_of_probe twice. Second, if 
either DMI or ACPI probe successfully but OF doesn't, then you return an 
error code instead of success, and also overwrite settings with an error 
pointer thus rendering both brcmf_dmi_probe and brcmf_acpi_probe useless

>   	}
>   	return settings;
>   }
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> index e406e11481a62..5f61363fb5d0e 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.c
> @@ -6,6 +6,7 @@
>   #include <linux/of.h>
>   #include <linux/of_irq.h>
>   #include <linux/of_net.h>
> +#include <linux/clk.h>
>   
>   #include <defs.h>
>   #include "debug.h"
> @@ -65,17 +66,21 @@ static int brcmf_of_get_country_codes(struct device *dev,
>   	return 0;
>   }
>   
> -void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
> -		    struct brcmf_mp_device *settings)
> +int brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
> +		   struct brcmf_mp_device *settings)
>   {
>   	struct brcmfmac_sdio_pd *sdio = &settings->bus.sdio;
>   	struct device_node *root, *np = dev->of_node;
> +	struct clk *clk;
>   	const char *prop;
>   	int irq;
>   	int err;
>   	u32 irqf;
>   	u32 val;
>   
> +	if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
> +		return 0;
> +

return 0 implies this function has completed successfully, while in this 
case it's obviously returned early due to not finding the correct device 
in DT. -ENODEV perhaps?

>   	/* Apple ARM64 platforms have their own idea of board type, passed in
>   	 * via the device tree. They also have an antenna SKU parameter
>   	 */
> @@ -105,7 +110,7 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
>   		board_type = devm_kstrdup(dev, tmp, GFP_KERNEL);
>   		if (!board_type) {
>   			of_node_put(root);
> -			return;
> +			return 0;

-ENOMEM?

>   		}
>   		strreplace(board_type, '/', '-');
>   		settings->board_type = board_type;
> @@ -113,8 +118,13 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
>   		of_node_put(root);
>   	}
>   
> -	if (!np || !of_device_is_compatible(np, "brcm,bcm4329-fmac"))
> -		return;
> +	clk = devm_clk_get_optional_enabled(dev, "lpo");
> +	if (!IS_ERR_OR_NULL(clk)) {
> +		brcmf_dbg(INFO, "enabling 32kHz clock\n");
> +		clk_set_rate(clk, 32768);
> +	} else if (PTR_ERR_OR_ZERO(clk) == -EPROBE_DEFER) {

PTR_ERR should be enough, no? Or better yet move this to the bottom of 
the function as was discussed on your previous submission, then you can 
return PTR_ERR_OR_ZERO(clk) right away, which would be a bit neater.

> +		return -EPROBE_DEFER;
> +	}
>   
>   	err = brcmf_of_get_country_codes(dev, settings);
>   	if (err)
> @@ -123,23 +133,25 @@ void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
>   	of_get_mac_address(np, settings->mac);
>   
>   	if (bus_type != BRCMF_BUSTYPE_SDIO)
> -		return;
> +		return 0;
>   
>   	if (of_property_read_u32(np, "brcm,drive-strength", &val) == 0)
>   		sdio->drive_strength = val;
>   
>   	/* make sure there are interrupts defined in the node */
>   	if (!of_property_present(np, "interrupts"))
> -		return;
> +		return 0;

-ENOENT?

>   
>   	irq = irq_of_parse_and_map(np, 0);
>   	if (!irq) {
>   		brcmf_err("interrupt could not be mapped\n");
> -		return;
> +		return 0;

-ENXIO?

>   	}
>   	irqf = irqd_get_trigger_type(irq_get_irq_data(irq));
>   
>   	sdio->oob_irq_supported = true;
>   	sdio->oob_irq_nr = irq;
>   	sdio->oob_irq_flags = irqf;
> +
> +	return 0;
>   }
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.h
> index 10bf52253337e..ae124c73fc3b7 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/of.h
> @@ -3,11 +3,12 @@
>    * Copyright (c) 2014 Broadcom Corporation
>    */
>   #ifdef CONFIG_OF
> -void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
> -		    struct brcmf_mp_device *settings);
> +int brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
> +		   struct brcmf_mp_device *settings);
>   #else
> -static void brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
> -			   struct brcmf_mp_device *settings)
> +static int brcmf_of_probe(struct device *dev, enum brcmf_bus_type bus_type,
> +			  struct brcmf_mp_device *settings)
>   {
> +	return 0;
>   }
>   #endif /* CONFIG_OF */
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> index 06698a714b523..c34405a6d38b8 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2457,6 +2457,9 @@ brcmf_pcie_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		ret = -ENOMEM;
>   		goto fail;
>   	}
> +	ret = PTR_ERR_OR_ZERO(devinfo->settings);
> +	if (ret < 0)
> +		goto fail;
>   
>   	bus = kzalloc(sizeof(*bus), GFP_KERNEL);
>   	if (!bus) {
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> index 6b38d9de71af6..7d79e2db201b5 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> @@ -3943,7 +3943,7 @@ static const struct brcmf_buscore_ops brcmf_sdio_buscore_ops = {
>   	.write32 = brcmf_sdio_buscore_write32,
>   };
>   
> -static bool
> +static int
>   brcmf_sdio_probe_attach(struct brcmf_sdio *bus)
>   {
>   	struct brcmf_sdio_dev *sdiodev;
> @@ -3953,6 +3953,7 @@ brcmf_sdio_probe_attach(struct brcmf_sdio *bus)
>   	u32 reg_val;
>   	u32 drivestrength;
>   	u32 enum_base;
> +	int ret = -EBADE;
>   
>   	sdiodev = bus->sdiodev;
>   	sdio_claim_host(sdiodev->func1);
> @@ -4001,8 +4002,9 @@ brcmf_sdio_probe_attach(struct brcmf_sdio *bus)
>   						   BRCMF_BUSTYPE_SDIO,
>   						   bus->ci->chip,
>   						   bus->ci->chiprev);
> -	if (!sdiodev->settings) {
> +	if (IS_ERR_OR_NULL(sdiodev->settings)) {
>   		brcmf_err("Failed to get device parameters\n");
> +		ret = PTR_ERR_OR_ZERO(sdiodev->settings);
>   		goto fail;
>   	}
>   	/* platform specific configuration:
> @@ -4071,7 +4073,7 @@ brcmf_sdio_probe_attach(struct brcmf_sdio *bus)
>   	/* allocate header buffer */
>   	bus->hdrbuf = kzalloc(MAX_HDR_READ + bus->head_align, GFP_KERNEL);
>   	if (!bus->hdrbuf)
> -		return false;
> +		return -ENOMEM;
>   	/* Locate an appropriately-aligned portion of hdrbuf */
>   	bus->rxhdr = (u8 *) roundup((unsigned long)&bus->hdrbuf[0],
>   				    bus->head_align);
> @@ -4082,11 +4084,11 @@ brcmf_sdio_probe_attach(struct brcmf_sdio *bus)
>   	if (bus->poll)
>   		bus->pollrate = 1;
>   
> -	return true;
> +	return 0;
>   
>   fail:
>   	sdio_release_host(sdiodev->func1);
> -	return false;
> +	return ret;
>   }
>   
>   static int
> @@ -4446,6 +4448,7 @@ struct brcmf_sdio *brcmf_sdio_probe(struct brcmf_sdio_dev *sdiodev)
>   	struct brcmf_sdio *bus;
>   	struct workqueue_struct *wq;
>   	struct brcmf_fw_request *fwreq;
> +	int probe_attach_result;
>   
>   	brcmf_dbg(TRACE, "Enter\n");
>   
> @@ -4474,7 +4477,8 @@ struct brcmf_sdio *brcmf_sdio_probe(struct brcmf_sdio_dev *sdiodev)
>   	bus->brcmf_wq = wq;
>   
>   	/* attempt to attach to the dongle */
> -	if (!(brcmf_sdio_probe_attach(bus))) {
> +	probe_attach_result = brcmf_sdio_probe_attach(bus);
> +	if (probe_attach_result < 0) {
>   		brcmf_err("brcmf_sdio_probe_attach failed\n");
>   		goto fail;
>   	}
> @@ -4546,6 +4550,8 @@ struct brcmf_sdio *brcmf_sdio_probe(struct brcmf_sdio_dev *sdiodev)
>   
>   fail:
>   	brcmf_sdio_remove(bus);
> +	if (probe_attach_result < 0)
> +		return ERR_PTR(probe_attach_result);
>   	return NULL;

See my comment on the bcmsdh.c part above - perhaps initialize 
probe_attach_result to -ENODEV by default and just return 
ERR_PTR(probe_attach_result) here instead

Best regards,
Alexey
