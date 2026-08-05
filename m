Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C68003D9521
	for <brcm80211@lists.linux.dev>; Wed,  5 Aug 2026 05:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785908819; cv=none; b=dJ7oUOYQy8Fmlb0WJhQqQ9ZXh5hxUODfGv/cOMGMKf/7vquhpLqyx19aNT28ye3A4CXjQqyua4uOWZyP7sFUOcn0BDRuCU4cjhnFpU5fcDONWNewpq5BYpO+wl+ID8+OcJIHGYWFOXPVAMietDM4He6XTeR2XJGvgRlkn8ONJh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785908819; c=relaxed/simple;
	bh=3R24kW9XBknBCDrCJn5tZVJzgixI5XEO2i1Ce+QevZ0=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jiDh9CLccZF6KshoexMP7x/FooBO4M7/T9tCB8vPxatEIHg7BnhcT29wmLdrB5Z6TYwsZHSdyLdRTqb2R22kw1wsLxXB01Dluj17jo1t2kToD7PcK42hsYUMlHpsDDGNdJB0RFQQxWHjVOhiTO4IXo96M9V3QcHSTmGC9EkPoR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=W44E/WWI; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="W44E/WWI"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2ccf2360620so6151915ad.3
        for <brcm80211@lists.linux.dev>; Tue, 04 Aug 2026 22:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785908816; x=1786513616;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5BpLCfKAaXqi0duuQcGbfyu/XNCL8TH6OsPjIxhG+2w=;
        b=NTVkDLFxRa8KG7ntBfaPaXy+34soMdg/OZ+uzBqIFe8aFuLE68jOEyhHKnElzhvINq
         Er1xJzRMY0QMOhExBqT6y0Wt/KnmEIKekTJIDexOUoBAxIs0Qyh5RTQ638Y8m5yXY+IG
         D3nNUPF6QbFPJXje5iBqI83vMKteO7HcpfDN//vSw4J9qadMzQhQWT0dS6LaaSiMcOYF
         GIiqRVwITIQIKDlXaI88riFoxL4RGEnoXWzeL1LW5HwoiRDLloQvURoPVEBztuiiTZqT
         DNK2YHw9WgtLpi8WyHTgBJh7mqWaj/aKnU7JFU4NCgj2q/R0pLxCMM6Rh/q0Rpt6Yz3e
         EJng==
X-Forwarded-Encrypted: i=1; AHgh+RqsfWseZ5KtCazAP6eQEZ+NHie5EP6KoyqJ4dPxn+4F52dB65RQKqUee7jkaBX4DiqM2COwcWwtkh0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz49/QGkTLcp9lLTq0voOPfozIO3MItEXLDM4buJ3M7NkdMM8Ln
	+27Rl6N9Ll5LvWQ+yKivVO9QLmIEyAwY1KK00zDyyNz4FWvlnieA86L9PskTetbbQS2V64maFkj
	HMUoyjhBoWLqe2cYOJUpj1adHvtXuijNRRNjyO7shmKeuBp/kQYsnUQ42RftNEpqeN2ybssHKxE
	lW6cxMEeMxUKiVYaAakvzTErNcyHAqmHlXcefAY7Zw/eLdnDdi46OVLJcYW0AMqfjqFmpZ4qZ4I
	Ho5KWNVgX3RjlO4ok/QDw==
X-Gm-Gg: AR+sD13MPSO0HR8Lmbetn6H8DkoIGkHXRufIEvslDJBxtegAVtwb0ubNbUbBDjY0Pte
	5U/PBX+lqzr8npB8BKbWV6ndeqbrnO1/Bc3Ihj2GVK/sJMK4WjKbln/z2tcha68lbNHvV3nKC+Y
	KncauZIrSUlE0tLZlIpk9oY2joQ/joKDUdS5inzkCCWeFz1n3YHhof7NDH9KVG8l7qbYUgFyymY
	lHzlieq6vHM1bgfQqu9kIzxvkC310qF9v+CiNFtL2aL59hiOZRFD4giafo6AOWJwJWbt3fpbgxI
	P0Ew3gfv/X5i4R0Z5KFox6eOfURRlbRVm+gA+snSoyD+8e9FND/ulPCkK74XHPfSEOSrnbsjo2O
	gzua2C3pTPs9n9eYkmgkhBp+/DmUgPTfI3ZsuckLX0PntyXLkQZ2kbRSpjhcjc2wQckFHaYpKMU
	rrHaT+ZWuljZru8Q8iWQKW6+AfpUWPDf9kSDgCPDA=
X-Received: by 2002:a17:90b:55c7:b0:383:f52b:d616 with SMTP id 98e67ed59e1d1-3903c592495mr4355547a91.10.1785908815900;
        Tue, 04 Aug 2026 22:46:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-390392b0042sm492749a91.7.2026.08.04.22.46.55
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Aug 2026 22:46:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso603883a91.2
        for <brcm80211@lists.linux.dev>; Tue, 04 Aug 2026 22:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785908814; x=1786513614; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5BpLCfKAaXqi0duuQcGbfyu/XNCL8TH6OsPjIxhG+2w=;
        b=W44E/WWIARzJU6GLqKsY288iRKonJFP2uyzbZbRTH5ns/DHZF79KlK9hZIJ0eU3vXb
         utwCrvFmRL5AKb7a0G0OLc0gFvt9lh8aMYlVJjlFEhxIblra9F0RrE6fdLqxxyom13UQ
         C5HMn5Sy0w4bJ3/Yi5as7Psz3OXK3WZQbUvN8=
X-Forwarded-Encrypted: i=1; AHgh+RpmlU+4twIJWbP5s8sXD7OodgLXb/Kc7QVg+49cItuNiqOObfDO6c7M/X+uLnmDDFyrzqs0vr5YN4A=@lists.linux.dev
X-Received: by 2002:a17:90b:3c0b:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-3903c543fcbmr4155794a91.5.1785908814131;
        Tue, 04 Aug 2026 22:46:54 -0700 (PDT)
X-Received: by 2002:a17:90b:3c0b:b0:382:1a6f:ba3b with SMTP id 98e67ed59e1d1-3903c543fcbmr4155741a91.5.1785908813563;
        Tue, 04 Aug 2026 22:46:53 -0700 (PDT)
Received: from [10.229.42.78] ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315863b0c61sm12394631eec.6.2026.08.04.22.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 22:46:53 -0700 (PDT)
Message-ID: <2dc55d93-544f-47ec-b349-c206f5414f22@broadcom.com>
Date: Wed, 5 Aug 2026 07:46:46 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: Add support for BCM4361
 PCIe chipset
To: markuss.broks@gmail.com
Cc: Johannes Berg <johannes@sipsolutions.net>,
 linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev,
 brcm80211-dev-list.pdl@broadcom.com, linux-kernel@vger.kernel.org
References: <20260804-broadcom-staging-v2-1-cebdc69e938c@gmail.com>
Content-Language: en-US
In-Reply-To: <20260804-broadcom-staging-v2-1-cebdc69e938c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 04/08/2026 16:07, Markuss Broks via B4 Relay wrote:
> From: Markuss Broks <markuss.broks@gmail.com>
>
> Those are the required changes for the BCM4361 PCIe chipset support.

Hi Markuss,

That is a brief commit message. Maybe you can provide a bit of context 
for this patch answering these questions: Are you using this device in 
some project? What platform are you using (if any)? What works and what 
does not?

> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.

This really does not look very useful. Those EDITME: are for you! As the
actual patch did not change you can probably say:
   - fix subject format indicating wifi subsystem and wireless-next repo.

> - Link to v1: 
> https://patch.msgid.link/20260803-broadcom-staging-v1-1-f6f77e55b72e@gmail.com
> ---
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c       | 3 +++
> drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c       | 3 +++
> drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h | 2 ++
> 3 files changed, 8 insertions(+)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c 
> b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> index 55f4d7b970f2..914ae72a7b74 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -59,6 +59,7 @@ BRCMF_FW_CLM_DEF(43570, "brcmfmac43570-pcie");
> BRCMF_FW_DEF(4358, "brcmfmac4358-pcie");
> BRCMF_FW_DEF(4359, "brcmfmac4359-pcie");
> BRCMF_FW_DEF(4359C, "brcmfmac4359c-pcie");
> +BRCMF_FW_CLM_DEF(4361, "brcmfmac4361-pcie");

Are you sure the CLM blob is required? Can you test without it being 
present in /lib/firmware?

> BRCMF_FW_CLM_DEF(4364B2, "brcmfmac4364b2-pcie");
> BRCMF_FW_CLM_DEF(4364B3, "brcmfmac4364b3-pcie");
> BRCMF_FW_DEF(4365B, "brcmfmac4365b-pcie");

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h 
> b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
> index df3b67ba4db2..b800cbfdece1 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h

[...]

> @@ -86,6 +87,7 @@
> #define BRCM_PCIE_43602_2G_DEVICE_ID 0x43bb
> #define BRCM_PCIE_43602_5G_DEVICE_ID 0x43bc
> #define BRCM_PCIE_43602_RAW_DEVICE_ID 43602
> +#define BRCM_PCIE_4361_DEVICE_ID 0x441f

Please add:
+#define BRCM_PCIE_4361_2G_DEVICE_ID 0x4420
+#define BRCM_PCIE_4361_5G_DEVICE_ID 0x4421

Regards,
Arend

> #define BRCM_PCIE_4364_DEVICE_ID 0x4464
> #define BRCM_PCIE_4365_DEVICE_ID 0x43ca
> #define BRCM_PCIE_4365_2G_DEVICE_ID 0x43cb
