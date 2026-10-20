Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792495984;
	b=oTtvNpMpq6hhVx/9UfHTgi/uo+JPU50aR7mS5KIoVZcuUjfL7lBk2aaXk2tYxpRU4+Nc
	 JSRfN7mdds0ZXs1+u4ZDMHVoXt3pPo2LmTesEbDVnqOYxYmSF/FE7VZBPUKRRmYrxTNKW
	 S9r+u+lD8OtPCaXTccJ/HekmC5DE6pLCts/DH1ls1Ts/D1zCu63ooq5XDZwCBpxT0gTr8
	 PgxayiyUP1b2BMPJyfzjI2StF6U5olNLMJD8r5Me/LbPUFdomA3LMWipXwQK1MAqcPJlh
	 yAooMx+XV4JYKcoVFSKTf7GZcJQwGQCq5f7POnp6vyhk8Io3B4K4AsbiDPjxBsLk1Tw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792495984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=6w7JRuFovvwwUBTh/FtHv2xuiuhqO2jha1lfwIcoggA=;
	b=vdEMLN/0HxFIrLE8rtF2s9oa5H/Pga1wutvkGcpmEx0HKvztTPrdGXR8GOyeFT5uy7lV
	 KK+m4//F77/JGI+NXuqnJmAZ8T9+o4DsH0+Mmzw5QGuOhD8VEjeopWQHSYG6D309xViL3
	 mAuROa+mCY7rAbyjmBBlYOYpPlJaJdY2KZVhb0cDqike0e7rW8zum0en4NA8VyaSi81EC
	 s93D96jwhYjN7Evi588xsNvWdwF2mSunXYUv3EZ+5L4Vc37eCEJMkJAY9HDKkcKOT6+Io
	 SOtwiipRWHWTx44pXyXtO2ZVeZ0tq44XhGr8kuD35L2VgcgCCSk7h+ZDAh1TXPxbBNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=kiddier.org;
	spf=pass smtp.mailfrom=kiddier.org;
	dkim=pass header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b=Kg2eU5L1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F1606A31B
	for <brcm80211@lists.linux.dev>; Tue, 20 Oct 2026 11:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 208F1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kiddier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kiddier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=kiddier.org header.i=@kiddier.org header.a=rsa-sha256 header.s=google header.b=Kg2eU5L1
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eac925bac3so370050e0c.0
        for <brcm80211@lists.linux.dev>; Tue, 20 Oct 2026 04:33:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792495983; cv=none;
        d=google.com; s=arc-20260327;
        b=k0PzZ0AJlJLJBaxPq48Vg5icm4skfJ0aJpvGbGxbpelZK8gnFaUz98JQpoMorU7xmy
         1Hm7AoZ46ztAuQGVC6KNSZZeai+wAeq22EjjS8jmJjp7O4v/dBtcSsY6bTTShKna5Q4t
         TOuSfbTqiQtvwE1/89PuIBsGxTqzsyHn+d8CwkPuQR74lvEX1tW03eOzDu/ieNC7WJJu
         7H5Ep+zvM6+d1wZLZYdRxXP/RZmnTsIth0woHIG3jl2Ba8TCQ13gnAQd3IVsKdGnbKrz
         hD1BqKDM9NYyVolgk3IbIGB/OjUcDdSk/fu6MS98lfCRzbfnZ2bgY58UsHYt3K0ylr2B
         8hTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=6w7JRuFovvwwUBTh/FtHv2xuiuhqO2jha1lfwIcoggA=;
        fh=eBrhJa1lJH37wwcsI1/3G5ARcZAHpxqz5uprsLVmFEY=;
        b=EEHBl8+A6vsim2GDFE16+SjinZHdWWCckTILVWWAnpTLx2HhHqOYx/yAVcYZ5LX+NW
         Lh5/qpItHicRuef1ww68kHbcew1ubiSdGE6Ridlip2WIG/4bymnReNc/2GUn9+sZ1XTM
         L0FfwBLaoLMW/oa42HVU04tCtHqVjD7nMjTtOKkjnahxK65pN3YVy1HV+mAB8FBv7XwP
         P+sDdn5CoLeRf+oLRuYu7Qg6j6C1jKKFaaSITHYh7pFxF5NwdqtlXp0rkWweHxVQ5vYv
         PME1neXE8Qymebkmaj3TfV9e3gflpnImbZIWjYGqoh/a8l1I4NaZBxpma5V4CWELMHmu
         Ly1g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kiddier.org; s=google; t=1792495983; x=1793100783; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6w7JRuFovvwwUBTh/FtHv2xuiuhqO2jha1lfwIcoggA=;
        b=Kg2eU5L1ZH1/rhyBK1HBZXlrJ3dThch+WIhyXGs/eDNfqSCXg4Cpdw861WyMrsHEqQ
         RGhnrBOp/up7ePk56uyKQPyWbzpmvQ4vQZTWE62gmhZtDm3vu8wn2nObjH1KBy6lOYiq
         hxrx1yEV5BQthb7uNJHUwRBSEMZT+k4K6mork=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495983; x=1793100783;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6w7JRuFovvwwUBTh/FtHv2xuiuhqO2jha1lfwIcoggA=;
        b=czC9qaY0RD5AJMkDgzF+wcsi+3yxzbyDKNMPxKR+F7J7vpwmcsd/QEjfrI+CCHmoDU
         wZb7CfcDP+63yyijevfHLPsSTzNmU18yfGob97T0LbTF+XF3jVCgPgIz9rqf9L3xnD0H
         vAGsW42HPbj4xek7z68Vo1Pb0Us53935MUhhZYkZIchhUaZDTInffHsHkPVrspvIn9kT
         7w6LerMXyMuk/ALVVb2qqUV6WOZOKzy4ZpVIBZ0Cu1sJBsbkfD5KdX/h6bw1lUifJ6ng
         RAc+vMqWYBQ6sdR9XRZRPj4OiBQoy0z7RGUaAZZiAxC8M8zzWTRs49t1cay/fmXoz4+S
         lp1A==
X-Gm-Message-State: AFq9FYKPk8thmMbGmUzaTRNdK4C82/C5B35EATAAczJCHtrZi8nbHXgS
	bM3eHw1KbYwKVD2yMTYfLtwfE9ZTC5ASTkcEPVA7vm88C8L4Ekwy44PE9b/JY2ytjD3REx6pF7b
	habnmLRKJq2NyMv5jDsaCvscj9eXJXuPKvPsnXMvHeQ==
X-Gm-Gg: AYBFou24pUHQ0iLrUicvxEHrfuKkQr9Dq1nRHKfrg9/4JzEBb9lV6bGB8uAbpOOyr2m
	oPmJCsGOQvVjShzC5UG1QXCfkoSXBGrZfZSvZAanJkiPhOLlRrBq8rDCdgL9IvrAGOnu62nf7nI
	rnQYxfwXnFXHuMFIgaQGX89jBslLPgzNpRWoT1capZsiMQ9M4fKckc96453buO1xRHZaoUz0iuD
	cF+Bp9Y4zBT0d95TeP07RHUy70rqJtnAfs0txuKqgs91bAo5q8dMZv6oAIgtEGrLrC5EShvqBxk
	jLa76xcfL4c7j3v/DLb60nU+HghhXuyCyt0Ai19d6troLnFmGyAZrfbmlA==
X-Received: by 2002:a05:6122:4307:b0:5e9:7458:9bb2 with SMTP id
 71dfb90a1353d-5eaaa392b1emr2875328e0c.5.1792495982934; Tue, 20 Oct 2026
 04:33:02 -0700 (PDT)
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Peter Kiddier <peter@kiddier.org>
Date: Tue, 20 Oct 2026 22:32:51 +1100
X-Gm-Features: AclHuK_5AI531dlJobOpneIUNwUkuWTyVSnUQajyWhdToxWSB6hT9Bldv5uGkoQ
Message-ID: <CA+3E589O46nj=c1Y+Rwk_nPZZKEUjFvMfWaAFmQ2-7De9iUxFw@mail.gmail.com>
Subject: [REGRESSION] BCM4355 Wi-Fi fails with Intel IOMMU on 7.3.0-2-t2-noble
To: linux-wireless@vger.kernel.org
Cc: brcm80211@lists.linux.dev, iommu@lists.linux.dev, 
	arend.vanspriel@broadcom.com, regressions@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hello,

I am reporting a Wi-Fi regression on a 2018 Apple MacBook Air with a
T2 chip, running Linux Mint Zena based on Ubuntu 24.04.

The Broadcom BCM4355 Wi-Fi device works with kernel 7.2.11-3-t2-noble
but fails with 7.3.0-2-t2-noble. Disabling the Intel IOMMU using
intel_iommu=off restores Wi-Fi on 7.3.0-2.

Hardware:
- Apple MacBook Air 2018 (MacBookAir8,1)
- Wi-Fi: Broadcom BCM4355 802.11ac Wireless LAN SoC
- PCI ID: 14e4:43dc (subsystem 106b:0843)
- Driver: brcmfmac
- Interface: wlp2s0

Test results:

- 7.2.11-3-t2-noble, default kernel command line: Wi-Fi works.
- 7.3.0-2-t2-noble, default kernel command line: Wi-Fi fails.
- 7.3.0-2-t2-noble with intel_iommu=off: Wi-Fi works.
- Reloading brcmfmac on the failing configuration does not restore Wi-Fi.

On the failing 7.3.0-2 boot, the driver detects the device, loads its
firmware and creates wlp2s0:

brcmfmac 0000:02:00.0: enabling device (0000 -> 0002)
brcmfmac: brcmf_fw_alloc_request: using brcm/brcmfmac4355c1-pcie for
chip BCM4355/12
brcmfmac: brcmf_c_process_txcap_blob: TxCap blob found, loading
brcmfmac: brcmf_c_preinit_dcmds: Firmware: BCM4355/12 wl0: Jul  8 2023
17:49:51 version 9.30.503.0.32.5.87 FWID 01-e74b9cb0
brcmfmac 0000:02:00.0 wlp2s0: renamed from wlan0

However, Wi-Fi subsequently stops responding. The kernel log reports
errors including:

brcmf_msgbuf_query_dcmd: Timeout on response for query command
brcmf_cfg80211_scan: scan error (-5)
brcmf_run_escan: error (-5)
brcmf_msgbuf_tx_ioctl: Failed to reserve space in commonring
brcmf_cfg80211_get_channel: chanspec failed (-5)

There is also an error creating the P2P interface:

brcmf_cfg80211_add_iface: add iface p2p-dev-wlp2s0 type 10 failed: err=-52

I tried reloading the driver using:

sudo modprobe -r brcmfmac_wcc
sudo modprobe -r brcmfmac
sudo modprobe brcmfmac

The driver and firmware loaded again, but Wi-Fi remained unusable.

The firmware files are present under /lib/firmware/brcm/, and the
firmware version reported by the driver is the same on the working and
failing kernels.

The brcmfmac module metadata differs between the kernels:

Working kernel 7.2.11-3-t2-noble:
srcversion: 3B6176FDB720DDE8E7C596B

Failing kernel 7.3.0-2-t2-noble:
srcversion: 3DCA38D52402541701276CF

I did not find obvious PCIe AER or fatal errors in the failing boot's
kernel log.

It has been suggested testing intel_iommu=off after reloading
brcmfmac. The driver reload did not help, but booting with
intel_iommu=off restored Wi-Fi.

This strongly suggests an interaction between Intel IOMMU handling and
the BCM4355/brcmfmac driver in the 7.3.0-2-t2-noble kernel.

I have not tested a vanilla upstream kernel, so I cannot yet confirm
whether this reproduces outside the T2 kernel packages. Unfortunately,
I have limited time available for further testing, so I may not be
able to investigate additional requests promptly. I wanted to report
the reproducible behaviour and the intel_iommu=off workaround in case
it helps identify the regression.

Could you advise on further diagnostics, or whether this should be
investigated as an IOMMU or brcmfmac regression?

Thank you.
