Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703392;
	b=FJvHnorOgsoI+xwMfsPDqjn+j5waNm6JXUovtS3JLVCAdTv0cChEgSCmPjHQmIGWUPUB
	 TbpZWZnFubSBy2zUlIGpRYsDdoJKloetIuwyg5H9sXFXEcXc/BiT/EW+JCo2MzU0kSE+R
	 bhU/yckdzIBcwTSaETU2NfSs7nKYRmWYuZFVCNuDm1dI/aIP4m031ugrJwt1QGBErw5fU
	 mjrLIJGwiHEjHR/53aQibZOFrIaDrMUPZa1f+3Bw17rZRrDc/Ozjyu9qas7Si97xu3Y4W
	 wOUxtzUEYT0nRX6ic0IB5WByrQw4myjuLJPHEZSpDudX+M/c5h9KHy/vwnJ6R5E3S1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703392;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
	b=1db52Tza5ljGc9Xdes+9h5S9giwv4HEvlMgITpA3uSOqE5U0PrzKVXGQNhNYX3gBOnVn
	 MZpLoqxa7PAFjhNP4tAh/CmDn6ZxvTndtg6ZS/ObCMq6YeXFm2Q0q1a1pLyzF64nAQ66+
	 0RGIxSAp58KG0Jq6pByp7KNvc7FogEijQr3xb7vHsxeQITeEWL28lQ2pkd8sPitfy3PH2
	 1zvbBARrBXJAKCkF+wXNDPsVghBKIkkKmGhxziJXGGlRtz7gl5YrVjOqN1qM7QXxFsJMq
	 rQ2pt/y1WYPw37bK2nAYUX24PKLfKJLcO7tpdFjKAw7eSzMFZt0ArZTEnmXG0CEGeMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X8kLT8e8;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051E4606A32D
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 14:29:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 051E4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=X8kLT8e8
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b405d8f1cfso3545403a91.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703391; x=1796308191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
        b=OprSXhiChqDZbuD2nsg9gPg/WDv7dMkrsBubVEaOa/gVFOn49HmR84M4hRGW6rqNzD
         N2nj6FCvhjlhUwZXZr5dO/RF2ssS4RJphUXR88P5p4kUDk39IRgh29+eUtxTJmc4K20Y
         jzqrcwvzRmUmfJk8BaT1lsQfsyFAa/SGyka2tR7oRsTYBStnJ+Gr52c710TcV5tq3slf
         mK5TprldI8usbtQCysBWRLBMPRG9hjU8ELAWc4prMVuNDqIS++qmU7Zq5H6/cfFF8Fp7
         f8CTMJ87eByjHudWyPYlZIJ3MvddgNTvymSjlSHAu7xHDmixWPjIhMNkjAq08vtm0WqY
         suvA==
X-Forwarded-Encrypted: i=1; AL+hErHfpte4eEDgEmnDhCAAzkeS3zz8Xrzg+dIbf6rWoubneZspfy0r62Wc7NqFsF09yVdB9AVOJI7s2K8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9d3cPtrFK/t5czBEinNCmHvvzSFi4mWh76/lWCsb2TmrJEgUR2
	wEJO4ENZOn5eBMU8TxQC5EIpcYb6e4DSgtqutw4czAN1RS+3sDLrELQAUwBZM4Gy1DaKJpx7KHO
	x5moPEB/xkU3ihtCeKhEegtNi0uVZJFsAEWfOcTHDcbC0Nz0Sko/iZYCqWR9p8A2qpY66ljLjyT
	lao44KPmr6ZYQscs1tenx8aM11BCj5+/4J/BqfE7iiwAO2zPEciSxmXgvdT3B82M6vMDOdpoR08
	Vz+phgYGGkFZvsR6q1inQ==
X-Gm-Gg: AZFdTZdHKgX/SJ9+LKCJ7gJHG+KQiyf5YeuSC7C5fUqj2p5ki7Ck1Qc3xRb3YgFMJHf
	E3LJ7aKzXKFgGUZbyPmdB5lPyXM+20SJxlGwArAACY+RVlxhyUkY3LU1nGe0TV5884jxfrKIpFf
	3dzD1P3VSJBQ8cI8+XI//9A1oGDkBWb8nXVYussLqzOn4/QfmVUSI7fczeDoA7DjdhZ80wlwytB
	wUvcEAL6+unMHiJ4nkrBQMx+pqOg8FAX5eWjiiZ0Xg4pUSFJ+c6ei0a1nmDpibCQ6E+qg6nBwiw
	o8tpcltTparm2z5k5H2VVUeZ4OLNDGLaEVot0hzi1OyJibRPAf1AAsaEr8WshpJXjEI3dVx2VZG
	tgTV6kvpYwx1qvXRsUYEgK1q0mR88TW3zuFTdYGUYNOt1mnReuuKLzlaK8oqwby91y27RkAYAv8
	e75oXhRf7UUaEeXsgeKhehGMZ0NLs2hCowsX4D2g4=
X-Received: by 2002:a17:90b:5287:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3b41c7c22c0mr20966317a91.6.1795703391227;
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062e6c29sm15730159a91.7.2026.11.26.06.29.50
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55daa76673aso48269311cf.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703390; x=1796308190; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7JPjcO3yPvVZuSkwbOCs9C3BldA842+CvKCTpIECa48=;
        b=X8kLT8e8Uyh+76lh8si/zV6o1Ooh+xTO7R+F0Yl1JEbl+jPkhs80jfJ6SHLaly7lTK
         aziyQm9y9B6dcWt1BlTSyMtCqTKLWVS5DL5o8743A3n83x1TvrSjQfWgainQyKKaH+NK
         AuiUiIuDYZZA1RCUrOOgX6r5VO8tvMWi3IH38=
X-Forwarded-Encrypted: i=1; AL+hErEfN0oIRe9jNsz8dqLxQCvWzEjMi0yHLNSMhpMKrB/Rj7jsNPLaH5Sm4GC5DXgPwcmEUEYgTZTIUew=@lists.linux.dev
X-Received: by 2002:a05:622a:58c6:b0:55d:36d3:a949 with SMTP id d75a77b69052e-55d769ea509mr410976541cf.27.1795703390127;
        Thu, 26 Nov 2026 06:29:50 -0800 (PST)
X-Received: by 2002:a05:622a:58c6:b0:55d:36d3:a949 with SMTP id d75a77b69052e-55d769ea509mr410976211cf.27.1795703389662;
        Thu, 26 Nov 2026 06:29:49 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:48 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	michael.reeves077@gmail.com,
	marcan@marcan.st,
	j@jannau.net,
	asahi@lists.linux.dev,
	sebastian.reichel@collabora.com
Subject: Re: [PATCH v2 3/5] wifi: brcmfmac: pcie: probe again after a resume through firmware
Date: Thu, 26 Nov 2026 15:29:39 +0100
Message-ID: <20261126142942.881504-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-4-dev@deq.rocks>
References: <20261111120748.23795-4-dev@deq.rocks>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 11 Nov 2026 13:07:46 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> After ACPI S3 the chip comes back without its firmware, but the
> interrupt mask can read back nonzero, so brcmf_pcie_pm_leave_D3()
> takes the hot resume path and every command times out afterwards.
> Seen on the BCM4377 and BCM4364 of the T2 Macs.
>
> When the platform firmware handled the resume and WoWL is off, go
> straight to the existing remove and re-probe path.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

[...]

> ---
>  .../net/wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 10 ++++++++++
>  1 file changed, 10 insertions(+)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2844,6 +2845,15 @@ static int brcmf_pcie_pm_leave_D3(struct device *dev)
>  	devinfo = bus->bus_priv.pcie->devinfo;
>  	brcmf_dbg(PCIE, "Enter, dev=%p, bus=%p\n", dev, bus);
>
> +	/*
> +	 * Without WoWL the device is powered off when the platform firmware
> +	 * handles the system sleep, as with ACPI S3, and comes back without
> +	 * its firmware. Its registers can still read back nonzero, so probe
> +	 * it again.
> +	 */
> +	if (pm_resume_via_firmware() && !devinfo->wowl_enabled)
> +		goto cleanup;
> +
>  	/* Check if device is still up and running, if so we are ready */
>  	if (brcmf_pcie_read_pcie32(devinfo, devinfo->reginfo->intmask) != 0) {
>  		brcmf_dbg(PCIE, "Try to wakeup device....\n");

This applies to every chip handled by brcmfmac PCIe on any platform that resumes
through platform firmware, while the problem was seen on the BCM4377 and BCM4364 of
the T2 Macs. A device that keeps its power across S3 elsewhere resumed fine through
the hot resume path and now gets a full firmware reload. Please limit this to the
affected chips (e.g. check devinfo->ci->chip) or explain why a re-probe is right for
all of them.

The series "wifi: brcmfmac: pcie: recover from fatal PCIe errors"
(https://patchwork.kernel.org/series/1203582/) also re-probes the device, from its
PCI error resume callback with device_reprobe(). An error that hits during a
resume through platform firmware could start both re-probes. Please check how the
two interact, and make sure only one of them runs.

Regards,
Arend
