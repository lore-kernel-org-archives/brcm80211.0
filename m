Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792496986;
	b=XQ1BJZCplT537F5XSJ44La24PfPiPV20V1CjKeKl1L6uXVW6UIv5mvjSrPvv+gkcw+l4
	 hFjlI6yoiroeWSlIPt755OsUGjoKkxC9k2RqRywxnJSRgwWo/G8AI6yLii7CqGNVEg4IV
	 PWENjplQDv4bxVdLuxi/nc5224MXspA78vAE/xgGUnfflfamKkYK5yyEISiYJ76krgiXM
	 ZGB5fe3DRiJplnIeqyl6jLTivMXNlKReRTGzgISvY9mCNTtBznwB2hfu2AcoQYFfDGrQS
	 5lc2zz/FtHg2/qq0pInSDar1XYEa1ijgZuX+r190Ch/aJ+9IunjOQLjLTkBwh0L9F2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
	b=eQI3iKjhG+aOitJHErzOf09MW5gd/KupOrSSUULzfBmE9XpLOC30LvTtgOev6TF6Qmwb
	 GlnK1L3Tp1oO52nkpR8xQLxydx66pCWC7xHsGwIHjiEDg3PVpyhv2daGwEGCbHDeHt5YV
	 PRhTlnGntaBfdV9SxvKl7PwzUhpH9U8fB4ZYvngp06YIii6ZX6BEjOgFSiAG/xnosFLJL
	 Qd8RTA39ZZZD1MnPgu2pYZepADo0mlV1Uouvb9c0xCvuCTEo72FdPDlO6HI/+GRhNbeEl
	 dls8STjm0/c0/NfWvPpVQNdN3xT7BWo5a5GcL21lJDN1Gu5iBo8GKd7cXSxL7+sitZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kiddier.org;
	spf=pass smtp.mailfrom=kiddier.org;
	dkim=pass header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b="P/U5Q2Qu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.177
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D08606A328
	for <brcm80211@lists.linux.dev>; Tue, 20 Oct 2026 11:49:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14D08606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kiddier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kiddier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b=P/U5Q2Qu
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5eab93a9862so647130e0c.0
        for <brcm80211@lists.linux.dev>; Tue, 20 Oct 2026 04:49:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792496985; cv=none;
        d=google.com; s=arc-20260327;
        b=o/0bKxZTfgtXO9cVLAeMBbqeuECqXcU3CdpUYMpx4dtZPj/UAghE1V8SW3uB0E5WMO
         sCUGuEeC4J/W/4VuEFfKm3ZadZFxaGGBW0fqv3eX186wLGwqsjddNf4U9MECSwTQk3l7
         E1l+GDxRt+dya66TipCkQODkFjJFpgG8wMXStgALSOddVFwv0ii18JEjM2egdgpSLqU2
         t3W9k11wr/b4dpWKjmWE4buxhhgw8MJOa30SRRw0TJW2+WvI0vTAxwu6cWy9OWmegbeI
         KyzQ+RMLVKDOUHN5uyR3uDTfjIEPqral4EN5+f7PUBZA2DJRGIjyEk1J9HqUc5+ya8uy
         ZcKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
        fh=soUFqfkruCpqI1/Y82VNJnHTmeXhq4buh8XwThTmjsY=;
        b=G9jJr50c7iodaZo5h+DEybqp/dnvQMdkaVz4pc6Zh2HGhx5ieIKKdVEkdDprSM6L/4
         j0jmKkS1QuxsoBaOhMR3zgH7Tm0GKjqKOF1hzdn9ALoKrjg7SORhDB1uHt6tKT15eORV
         GvEgi1BPBMe+WQeYeqSdLAMs/JfQjPdqGz8s3h8N9dnwbbS1el4/lcDLWxkgVZGsydJT
         bXc2chR+5qkjPkiHFpJFPn38f/hhcBWDknx0/F6T8QBtFJZNJPFJcgII4clNCBkdOD/n
         3WQYTa1dPjb5Gm/uXEDMO7SoFKhBptKrlt3cKjywy6KtJdyCeKCwyEI5SV8vj4NZB57p
         16SQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kiddier.org; s=google; t=1792496985; x=1793101785; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
        b=P/U5Q2QuVUDd1Un3eSLXVWoANCWilmXwgEvWrdteXJQ4Enf+zVwpFY07RNGUDSi06m
         jawhPcM4C42kA9OMWqcDmvDXyFz0fwg+F6Of3MGTrUVPUUk2mDfr7lxya5qm2z++Qeim
         WfVrm1bvVSx21f1MV+3FNvZaNLy8sgnYJRWKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792496985; x=1793101785;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XLGNYitZ4EdMcotU/GOI9I5PtjbgIsDlPVNeP1wv+jI=;
        b=QxbO6wc8//iLU2kE9Q/AMyy99Vb+KhF85g28T6F2tTxJe397iJOmvsQbeGyw5tDzL7
         YB2BosCwjQJL91Z3LbczTNrPBbbjGwx6a6q9EwVf9fBDZK0LkijHbwXVQ/yWz4sP3mzw
         NEmYUlK7/txP6aabuCs3/3Ki6p+i4GZ2AY8H4CB9qOxS/oBssLISRZUQvfXSS0vqDo38
         XZTA4TJO5OfDjrtwrUmA7DK32c4B0MajIsgabpeZ55zmILvFVNA72iNGzVIN4CaGtK9f
         w2xSEfGPQsP4u1kXQONlTqnbj53cOCwzdYz/VMVcIGo8HzISW+lRKEO/4XukQ7u3cWnl
         y2iA==
X-Gm-Message-State: AFq9FYL4PKUogiocpVFl1fgLSYj+qliPP2BMfMD8MjewJNfPHGQlluAm
	jMkPyVP+u+Ghjj8RipuDTQ99f89LsaezkpsdUrGf8mjCmeiuxNMs13ZTmsU53fkyO66XC2bnZlZ
	nbS1us+A4tUENfo5RypfA7CSxMF3Xp0W/fSYaaH5c9Cmv8qR1BufeiBS7Ng==
X-Gm-Gg: AYBFou11xnzcA1eJCEQroWRTTyvDU8Hlrmlp6D/XimbHSa4ALZ2MOXxnPJ26Q+m3R59
	5GaoyjF7yk5DCOjDVyVNkfd6nkI6BgugtnaA8UE4w4XQUbwwsxNTUHtPA/F0zC9li/lmhIGyfXL
	4awLK8GF6pg+wug2ZaCPf67Pdb12KaJA5UwaakoJkEGSHo0lvbiYEEFhS51MNJ2n5MSrodfP2ep
	XrszehPZZ540/MPwUiFuqre7LZRHMU0qu6dTPDh0T29viXN0cPDMBBRMKV7ms84D0gR36iuRqzp
	wJ/Ft5VPnd/pkdBH1slZpFwQqISgIQQnAuMgnidX1nFuicmqZdUcKs5E6g==
X-Received: by 2002:a05:6122:8c1:b0:5da:9b81:1aa4 with SMTP id
 71dfb90a1353d-5eaaa3c174cmr3451932e0c.5.1792496984909; Tue, 20 Oct 2026
 04:49:44 -0700 (PDT)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <CA+3E589O46nj=c1Y+Rwk_nPZZKEUjFvMfWaAFmQ2-7De9iUxFw@mail.gmail.com>
In-Reply-To: <CA+3E589O46nj=c1Y+Rwk_nPZZKEUjFvMfWaAFmQ2-7De9iUxFw@mail.gmail.com>
From: Peter Kiddier <peter@kiddier.org>
Date: Tue, 20 Oct 2026 22:49:33 +1100
X-Gm-Features: AclHuK_KgzridKLRANvtLJkSHaLWJWHnmxsRRdoNj6COaR_e09DKIcJwjLUSHC0
Message-ID: <CA+3E58-2N-uVNsmwvOGDKZvtnDQ1DF=GzFbTyRLuN8FpAd4qdg@mail.gmail.com>
Subject: [REGRESSION] BCM4355 Wi-Fi fails with Intel IOMMU on 7.3.0-2-t2-noble
To: linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, iommu@lists.linux.dev, 
	arend.vanspriel@broadcom.com, regressions@lists.linux.dev, jgg@nvidia.com, 
	kevin.tian@intel.com, joro@8bytes.org, will@kernel.org, robin.murphy@arm.com, 
	dwmw2@infradead.org, baolu.lu@linux.intel.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Adding the IOMMU maintainers and linux-kernel.

The original report and test results are below for context.

I haven't tested a vanilla upstream kernel, and may have limited time
for further testing, but wanted to share the findings in case they're
useful.

Thank you.


On Tue, 20 Oct 2026 at 22:32, Peter Kiddier <peter@kiddier.org> wrote:
>
> Hello,
>
> I am reporting a Wi-Fi regression on a 2018 Apple MacBook Air with a
> T2 chip, running Linux Mint Zena based on Ubuntu 24.04.
>
> The Broadcom BCM4355 Wi-Fi device works with kernel 7.2.11-3-t2-noble
> but fails with 7.3.0-2-t2-noble. Disabling the Intel IOMMU using
> intel_iommu=off restores Wi-Fi on 7.3.0-2.
>
> Hardware:
> - Apple MacBook Air 2018 (MacBookAir8,1)
> - Wi-Fi: Broadcom BCM4355 802.11ac Wireless LAN SoC
> - PCI ID: 14e4:43dc (subsystem 106b:0843)
> - Driver: brcmfmac
> - Interface: wlp2s0
>
> Test results:
>
> - 7.2.11-3-t2-noble, default kernel command line: Wi-Fi works.
> - 7.3.0-2-t2-noble, default kernel command line: Wi-Fi fails.
> - 7.3.0-2-t2-noble with intel_iommu=off: Wi-Fi works.
> - Reloading brcmfmac on the failing configuration does not restore Wi-Fi.
>
> On the failing 7.3.0-2 boot, the driver detects the device, loads its
> firmware and creates wlp2s0:
>
> brcmfmac 0000:02:00.0: enabling device (0000 -> 0002)
> brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4355c1-pcie for
> chip BCM4355/12
> brcmfmac: brcmf_c_process_txcap_blob: TxCap blob found, loading
> brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4355/12 wl0: Jul  8 2023
> 17:49:51 version 9.30.503.0.32.5.87 FWID 01-e74b9cb0
> brcmfmac 0000:02:00.0 wlp2s0: renamed from wlan0
>
> However, Wi-Fi subsequently stops responding. The kernel log reports
> errors including:
>
> brcmf_msgbuf_query_dcmd: Timeout on response for query command
> brcmf_cfg80211_scan: scan error (-5)
> brcmf_run_escan: error (-5)
> brcmf_msgbuf_tx_ioctl: Failed to reserve space in commonring
> brcmf_cfg80211_get_channel: chanspec failed (-5)
>
> There is also an error creating the P2P interface:
>
> brcmf_cfg80211_add_iface: add iface p2p-dev-wlp2s0 type 10 failed: err=-52
>
> I tried reloading the driver using:
>
> sudo modprobe -r brcmfmac_wcc
> sudo modprobe -r brcmfmac
> sudo modprobe brcmfmac
>
> The driver and firmware loaded again, but Wi-Fi remained unusable.
>
> The firmware files are present under /lib/firmware/brcm/, and the
> firmware version reported by the driver is the same on the working and
> failing kernels.
>
> The brcmfmac module metadata differs between the kernels:
>
> Working kernel 7.2.11-3-t2-noble:
> srcversion: 3B6176FDB720DDE8E7C596B
>
> Failing kernel 7.3.0-2-t2-noble:
> srcversion: 3DCA38D52402541701276CF
>
> I did not find obvious PCIe AER or fatal errors in the failing boot's
> kernel log.
>
> It has been suggested testing intel_iommu=off after reloading
> brcmfmac. The driver reload did not help, but booting with
> intel_iommu=off restored Wi-Fi.
>
> This strongly suggests an interaction between Intel IOMMU handling and
> the BCM4355/brcmfmac driver in the 7.3.0-2-t2-noble kernel.
>
> I have not tested a vanilla upstream kernel, so I cannot yet confirm
> whether this reproduces outside the T2 kernel packages. Unfortunately,
> I have limited time available for further testing, so I may not be
> able to investigate additional requests promptly. I wanted to report
> the reproducible behaviour and the intel_iommu=off workaround in case
> it helps identify the regression.
>
> Could you advise on further diagnostics, or whether this should be
> investigated as an IOMMU or brcmfmac regression?
>
> Thank you.
