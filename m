Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1068438550C
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 18:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411389; cv=none; b=Ea2SItlhREIQ8vATKhnzkkQHgrJMA17kJKKIscVucQg5bDKfRu17QJ20Yfvrqc+v7CUVMT790WFEIIz5aVl2AO+RC2NWcw5tU5cn39BCq3FmVspVdySeSnzaPnhg6jeFMDs2tYsRBpDvRZCnZD0Z01JTF28dpo8n3jYYsliNg2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411389; c=relaxed/simple;
	bh=VLY1Umk1yU84Icqq1PhsKQcaMi/Ow7hXTIZ5IR8tK0s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UrqeQxZZniZbjUvkdUxvRX2WG1GNpgTy1kDzJKVER8ZPCcPRDrseWTLhquhd3msD09HphV+UHpJiWcOc7z0rCY/zvuIbQsVi+mM69zDqpxCt177yulju4L6U/4u+/KDkH/xenmU+lDuANawqhyTg6NqgvD0wJ2qAX22eVwJFDUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=U4RyGYHu; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="U4RyGYHu"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3990fe066ebso2934114a91.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 11:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411387; x=1790016187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QZHVxUjP7ai7HQXDh9w3LrC0rVTP6eIyhyn5Gf7ApeE=;
        b=CGXLLz7XfLDFGOYqGhxmyfqpFk7lXx6RZkVJ1x57EhPdpQ6pXisB3SaGECCR84OmGt
         70mBThTWQEwholgoicmKIViQacz+DILYoVrwwYB1oEdSdnDJL++q+RlT/GVIba1BPiSp
         EPGj3yrJs8YOmfHdFwtMtHXmaw7ZNIuGzqIKpcU4v3ln37v3dIvncbslf8gwxgzM1bFI
         xsUfnmrd5DPdPUq2uYOpTuZCLny9/78pKxoIKvbbA6ZdaImkOjqq9Cd9qMKFUrSFv5jK
         5iaRW5F97FuerB9Q+E79CeVvW5vlIwCQN743VwlL3I52Wmz3rebLvig13dLiPDxFU9iN
         WhvQ==
X-Forwarded-Encrypted: i=1; AKwUvByvgABkR40A+KljM62iM9klBe4rp5TKAF1oSfTcxoNq2Xr8R94A23OSFdGabdkws/UNTQDGEZm5EsI=@lists.linux.dev
X-Gm-Message-State: AFuF++lkAbfFDrinvf4G2qqWAJ72iwMVAtPEHT3ud8HWXgKCXPrmtPU4
	xhvcOt75oOcJfQELo4t6n2PL+tXc58EccF9IWBbHnDc9H8lFlZiI1YEWreBmE+E2huAaoWoQfwa
	PCMR/aZOxNR3yxagjweqBlc1gsgd/5lp4EKmEOZTZzQazMTkmfo2D77mnZaQY/PlkGgeVgy/GzZ
	/jDqTerg0Nvj2cwrNQUgbE2vNeiFHGxaMq1zYAvAUm+4MSyQfp99kpVxc6w9pmK9j1ATtSXzeaE
	nGiitnAiahQT59F2OE=
X-Gm-Gg: AYBFou1FmbjJGTMGCwF7NfadLcJC+WnJ9RxRryrsLUgW3n8UimJvZfMC48k9nxVct6g
	/BqtVmL/jN15njKT6Z3OHgvdg63niFK9I/vjqfltyjlkMQlzGnGW9lB6jiORPZ+kCKFIEOVTSb0
	/I3G7l3Uf0rQDpW8V2GdsTsUx1yr8AJn8SBYdWmx/oRWGVfr04gWcnj3lPiq9L8nGLmH2x8K2eX
	fQpkm4nHyzQW52uexLpyfbr+EPsMb/4GcEsDR9AvOk8BiPO7mr7iL4Hho1bqp87HXKYFvM/OUfg
	U7No+EaTOyQGgiZTKI7PzsCIW9PpnmIoILCoqBQl2y1ZnLmfn+ggG8g5My9FDtmiM+NY49KbVH8
	oFi208pPPsVAkQZE+X/DEPchbtZaTgSqEuAa0w3ugTLqvcO5rnW5IkFbV+EfvKe9LcOzLFXfAeg
	RS/zBIJkXBaa5NNEbzu91DQQJj8Dmx4oQ9V4O5Vis=
X-Received: by 2002:a17:90b:17cc:b0:398:9be9:ab92 with SMTP id 98e67ed59e1d1-39dec1489ccmr7359363a91.23.1789411386723;
        Mon, 14 Sep 2026 11:43:06 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-77.dlp.protect.broadcom.com. [144.49.247.77])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39dfdacbab1sm204938a91.4.2026.09.14.11.43.06
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:43:06 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39dc5d85a9cso2471375a91.2
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 11:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789411385; x=1790016185; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QZHVxUjP7ai7HQXDh9w3LrC0rVTP6eIyhyn5Gf7ApeE=;
        b=U4RyGYHur4T4iIABgIII5NJb8EnrPcYWtwmpBrN02HS0/22m2/rSZOzZsVHiSD24+5
         17ym24Ty26uy56c+gRrEq7ffhAwjNNkjG4eUUWRNIbmf2QcQmpW8gTiOp10WaN20t9lQ
         RTEJ/WVoDTr4HwhDvmkqthGtoSoTd9/pxOhqE=
X-Forwarded-Encrypted: i=1; AKwUvBzBiknagap/xrW+MEfy8iER8kibNSm2+xeARHWp+S67APnyHFkZgo6wL7q00JQwYW2kIF4Fgt+pwNc=@lists.linux.dev
X-Received: by 2002:a17:90b:5850:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-39dfcbf80a3mr1839040a91.1.1789411384878;
        Mon, 14 Sep 2026 11:43:04 -0700 (PDT)
X-Received: by 2002:a17:90b:5850:b0:39d:fcbe:fdcf with SMTP id 98e67ed59e1d1-39dfcbf80a3mr1838993a91.1.1789411384448;
        Mon, 14 Sep 2026 11:43:04 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e52a60sm27509723eec.6.2026.09.14.11.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:43:03 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Markuss Broks <markuss.broks@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next v3] wifi: brcmfmac: Add support for BCM4361 PCIe chipset
Date: Mon, 14 Sep 2026 20:42:59 +0200
Message-ID: <20260914184259.1466535-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260820-broadcom-staging-v3-1-7d5741e37efb@gmail.com>
References: <20260820-broadcom-staging-v3-1-7d5741e37efb@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 20 Aug 2026 20:59:01 +0300, Markuss Broks wrote:
> Those are the required changes for the BCM4361 PCIe chipset support.
> BCM4361 is a dual band 2.4GHz and 5GHz WiFi + Bluetooth combo chipset,
> installed on several mobile devices, such as Samsung Galaxy S9.
>
> Tested on Samsung Galaxy S9 (SM-G960F), where it's connected by PCIe link.

[...]

> +#define BRCM_PCIE_4361_DEVICE_ID	0x441f
> +#define BRCM_PCIE_4361_2G_DEVICE_ID	0x4420
> +#define BRCM_PCIE_4361_5G_DEVICE_ID	0x4421

The 2G and 5G device IDs are defined here but not added to
brcmf_pcie_devid_table[] in pcie.c. I might have been clearer
on that, but it seemed obvious to me. Please add them as well.
Refer to 43602 device which has similar device IDs.

Regards,
Arend
