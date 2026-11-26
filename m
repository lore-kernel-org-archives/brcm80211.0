Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703385;
	b=SR5pR810gRyc3e7MK4V65zl/7OAHBNgNK2xAuRD1OQdR6+SaxHdpw2vMykn/kiah92oA
	 CVPJurRs4TC8txeXAH4Ok9lDV61ImZiYOnIHwrtcYYW8l5ePHbyKX+hbWdq/C6fLSVSKd
	 JBKHopkwyXZ77xCVkFa6X5gU6tBiGU1w+7/mG18ypy2P90+gP1wdWlNILcDt5CBobm1TJ
	 l4OOBrAqTrbFkI76qeLPtmNsjPKHZV4iXQbFi8JukpT2y9xJiWGo31util0hXp3UcejXB
	 a326+i8HnodQCeY5no//ARlM1/6BfgnJn2AijtXEkJ2+hEo73b4Fp8GTcRT1etWMW1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703385;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=NKlbjUGPKr++A1S37oUvVp/fVMTUi8hDoA/ZvgkjDcw=;
	b=ol/eNVNoBF3bEg3o+ZbssMrMpmFdPpXIvoyTMjdlw9cYOsEf7hRcmj/NkXLrq/DU7GD8
	 fS2igy6JkVbCNSqAmo4Za7z3GfT9EXsuMyG6aC8JLw2WVUF4+yXPzqkD3fjaNxeNhBPWV
	 mLEJB2XsWplHy0jyWBxu+Pf8pIsywmQrarMaCQbFL1d/JZ4I2Bh6X9sI9g3ZkApyVazpp
	 ALsgxW2BiqvBschILN4JO2wy7qXW7Mi58+7l6yQ7zfxPgxVMvPMN/1B4xS3xa319nycmh
	 FkY/qnB9n8PUtWdmPHOElMe5DtYqpmAOoVUxQQqmIHt/4hc5kVY8DqxUhIEJnN2UnRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Wo4RwhvL;
	arc=none smtp.remote-ip=209.85.216.98
Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871DA606A329
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 14:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871DA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Wo4RwhvL
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3b49a6e8212so2792096a91.2
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703385; x=1796308185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NKlbjUGPKr++A1S37oUvVp/fVMTUi8hDoA/ZvgkjDcw=;
        b=KH5CqNs4uguLxsibmxjcTNDr3N4Psb5qpBkxRHExX8Ox/bpR5JrVgM6JQSPBpfCJul
         3ewqKqTMUDZ0jgJqWzrNEwkrVJHdsJly/XHHTMTjw0T5P4XXVKsnA+8j52rrtIoeHy4g
         3KRMpFEqlAKwMwO7HWFZnTXrFYfuQzcnaIAyJgdq/GdqPGkxxKDYe+LNwi1ThBkHbSvO
         pznr4ZlQ1LgO5yjgnl7/5540GFpz+6zXeA3s4NuaXDx5VNEkzrzTTxjpeWOoXcyIWb0w
         Fz8Xj6SkoDIqt3E0JxoCyS3vGLajJvyFzLD3ZkQK0WpAPX1slJTzdSf1vWVFQFkGPsQ5
         KqOQ==
X-Forwarded-Encrypted: i=1; AL+hErHQfy7HtYer09WUMEcl/bscF6wdoBO+y/QiMv6L2WsUCVSp3BqD7kF3t7zzMzPhpCfDJ7pl22eKqkI=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Kxm2NR9uXSGAC5ctEEOtg61ebp9BjEYa+XHF09vfKYHMLlXtx
	0cIUeFKvSaW/5qJhxvWxFRTU2N/XwtqtHTjkPc9MgmiI5X4SGs+gy2pfiWvL1/35DFyuw8GL0mY
	n4wJMaw++dGv5P5KqbDLadpzg5PgziStnyQzCF8YFRcr/B/T8mIRZv9bMjGlJGwrjmAgUOt8/wu
	Q/ufrT3neRg646A83QniwJnxb7FTaJl6cbkZJrSg0UERmW6145VkcCPPyqZhsimGAXYC/m/dGVr
	jiSisjWi2M7i5xVvUs=
X-Gm-Gg: AZFdTZe5WYxFswfjfeu333k70N8Q+tH7VD42lQp115LRL6JhEcLNrIr+s/ot9GHFFV3
	cdChxj6utNR8dpsGktJaouEVfOCcRk24COLu8dW/16R51yI4NUPSAwmPBJ5UBM58lHSdHwez9pq
	hhAPoXw6AbV7M+DJHMV/NQO9lqEeZG+Ow9LnZ7qwBbAQhQXso2MZTJw1OUV+FTBwW7QLM25unKm
	Hlyfl21SL/kUya9TqYncCihUX+9EoS0irgXwyK3ktJ5gWapG7HXtFx9Q1qqc0D87RAvCrOZ9fwg
	0wgTvc965XLZnmtx9h2sqeKhZhbx+ncsI1/l5/2kyONo8ZvReCdkBVFWib85jd0OsUgaLbyGsjc
	9sTmkUA9rakbXH5DQx7exnCXpPAqZupxPjobSHWkQUoayadIN0wbeOK3l0JscqOJo9Pg8xaSega
	mL3Lmh+vDT6owD+l8dWm8IGFUQY8zt99lQFuN4Ay/ewQ==
X-Received: by 2002:a17:90b:3a45:b0:3ac:4e18:2390 with SMTP id 98e67ed59e1d1-3b41c8528f4mr20910386a91.7.1795703384844;
        Thu, 26 Nov 2026 06:29:44 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b411775fa6sm15813776a91.1.2026.11.26.06.29.43
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:44 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9210a12765eso94942176d6.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703382; x=1796308182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NKlbjUGPKr++A1S37oUvVp/fVMTUi8hDoA/ZvgkjDcw=;
        b=Wo4RwhvLRx+0h8NpeSXd1ibSBCxHYLfGA/hP4AF6MDCRPhr6oqOBmcZSJheo9vdQRG
         BD1MVIU//s6pV4bSsPeTeCcKTRh3KAUuUS50uKE3BeokAr1Ei/OoOhRkG8jF57PWsvyX
         5apgRePS2wNGfQzo/+JDilD2tiZe/zDr9ie0A=
X-Forwarded-Encrypted: i=1; AL+hErFVPd43J6Iq6Ba1cml+pQwYnXPBu8mFrPRGvteDLhgTPUon4ERijSeV8Awbn5M5FSrMNh+PzD9RVA0=@lists.linux.dev
X-Received: by 2002:a05:6214:1d07:b0:91f:3138:8a64 with SMTP id 6a1803df08f44-92134b49c51mr359611046d6.41.1795703382394;
        Thu, 26 Nov 2026 06:29:42 -0800 (PST)
X-Received: by 2002:a05:6214:1d07:b0:91f:3138:8a64 with SMTP id 6a1803df08f44-92134b49c51mr359610596d6.41.1795703381898;
        Thu, 26 Nov 2026 06:29:41 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm187895256d6.1.2026.11.26.06.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:41 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Soeren Coremans <sorencoremans@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH wireless-next 3/3] wifi: brcmfmac: pcie: recover from fatal PCIe errors
Date: Thu, 26 Nov 2026 15:29:33 +0100
Message-ID: <20261126142933.875175-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105215954.184290-4-sorencoremans@gmail.com>
References: <20261105215954.184290-4-sorencoremans@gmail.com>
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

On Thu,  5 Nov 2026 22:59:54 +0100, Soeren Coremans <sorencoremans@gmail.com> wrote:
> brcmfmac registers no pci_error_handlers, so a fatal AER error leaves
> the device dead until reboot ("AER: can't recover (no error_detected
> callback)"). On a BCM4366 this happens after some firmware traps: the
> trap starts a driver reset, and about 0.7 s later the downstream port
> reports an FCP error.
>
> Add error handlers:
>
> - error_detected: mark the bus down, block the driver's own reset work
>   and request a link reset.
> - slot_reset: restore the config space saved at probe, then check that
>   the backplane answers; a wedged card would stall the CPU on every
>   MMIO read during firmware download.
> - resume: re-probe the device from a work item. The link reset returns
>   the chip to its power-on state, which brcmf_pcie_reset() does not
>   fully re-initialise: after it, association failed in 5 of 9 runs,
>   while 16 of 16 re-probes recovered.
>
> A dongle setup that fails while recovery is in progress no longer
> releases the driver, as that would race with the re-probe.
>
> Tested with aer_inject (FCP on the downstream port), alone and 0.3 s
> after a debugfs-triggered reset: WiFi back within 6-12 s in 16 of 16
> runs, on a BCM4366/4 (14e4:43c3) with a kernel built from the
> Ubuntu 7.0.0-42 source, which is based on v7.0.14.
>
> Also tested against real FCP errors, without injection: resets under WiFi
> traffic caused 3 in 47 runs, and all 3 recovered within 4-11 s.
>
> This relies on the console read fix earlier in this series: without it,
> a reset that is already running on the dead device never finishes, and
> error_detected() waits for it forever.
>
> Found and written with the help of an AI coding assistant (Claude Opus
> 5.5); the cover letter describes how.
>
> Signed-off-by: Soeren Coremans <sorencoremans@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 128 +++++++++++++++++-
>  1 file changed, 127 insertions(+), 1 deletion(-)

[...]

> @@ -3153,11 +3160,117 @@ static const struct pci_device_id brcmf_pcie_devid_table[] = {
>  MODULE_DEVICE_TABLE(pci, brcmf_pcie_devid_table);
>
>
> +static pci_ers_result_t brcmf_pcie_error_detected(struct pci_dev *pdev,
> +						  pci_channel_state_t state)
> +{
> +	struct brcmf_bus *bus = dev_get_drvdata(&pdev->dev);
> +	struct brcmf_pciedev_info *devinfo;
> +
> +	if (!bus)
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	if (state == pci_channel_io_perm_failure)
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	if (state == pci_channel_io_normal)
> +		return PCI_ERS_RESULT_CAN_RECOVER;
> +
> +	devinfo = bus->bus_priv.pcie->devinfo;
> +	brcmf_err(bus, "PCIe link frozen, resetting\n");
> +	WRITE_ONCE(devinfo->in_pci_recovery, true);
> +	devinfo->state = BRCMFMAC_PCIE_STATE_DOWN;
> +	brcmf_bus_cancel_reset_work(bus);
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}

This only drains the bus reset work. The firmware callback brcmf_pcie_setup()
queued by brcmf_pcie_reset() runs from the firmware loader and nothing here
waits for it. It can be in flight, e.g. polling for firmware init in
brcmf_pcie_download_fw_nvram(), or not have started yet. It then uses the
BAR0 window concurrently with slot_reset(), and the re-probe can free devinfo
and bus underneath it. Please make sure that callback has finished (or cannot
start) before the link is reset and the device re-probed.

Also, the setup failure path only tests in_pci_recovery before calling
device_release_driver(). If error_detected() runs after that test, the device
gets released between error_detected() and slot_reset(), which then finds no
drvdata and gives up.

[...]

> +static struct workqueue_struct *brcmf_pcie_err_wq;
> +
> +struct brcmf_pcie_reprobe {
> +	struct work_struct work;
> +	struct pci_dev *pdev;
> +};
> +
> +static void brcmf_pcie_reprobe_worker(struct work_struct *work)
> +{
> +	struct brcmf_pcie_reprobe *rp =
> +		container_of(work, struct brcmf_pcie_reprobe, work);
> +	int err;
> +
> +	err = device_reprobe(&rp->pdev->dev);
> +	if (err)
> +		pci_err(rp->pdev, "re-probe after PCIe error failed: %d\n", err);
> +	pci_dev_put(rp->pdev);
> +	kfree(rp);
> +}
> +
> +/* A link reset returns the chip to its power-on state, which only a full
> + * probe initialises correctly. The re-probe frees all driver data, so it
> + * runs from a work item that holds nothing but the PCI device.
> + */
> +static void brcmf_pcie_resume_from_error(struct pci_dev *pdev)
> +{
> +	struct brcmf_bus *bus = dev_get_drvdata(&pdev->dev);
> +	struct brcmf_pcie_reprobe *rp;
> +
> +	if (!bus || !READ_ONCE(bus->bus_priv.pcie->devinfo->in_pci_recovery))
> +		return;
> +
> +	rp = kzalloc_obj(*rp);
> +	if (!rp)
> +		return;
> +	brcmf_err(bus, "PCIe link recovered, re-probing\n");
> +	INIT_WORK(&rp->work, brcmf_pcie_reprobe_worker);
> +	rp->pdev = pci_dev_get(pdev);
> +	queue_work(brcmf_pcie_err_wq, &rp->work);
> +}
> +

If recovery is abandoned (slot_reset() returns DISCONNECT, or the allocation
above fails) in_pci_recovery stays set, so later dongle setup failures are
ignored without releasing the driver, and the allocation failure is not even
logged.

brcmf_pcie_pm_leave_D3() already calls brcmf_pcie_remove() and
brcmf_pcie_probe() directly from a callback that runs under the device lock.
Is there a reason resume() cannot do the same instead of using a work item, a
dedicated workqueue and device_reprobe()?

The series "wifi: brcmfmac: pcie: S3 and deep sleep on the T2 Mac chips"
(https://patchwork.kernel.org/series/1208304/) changes the same code. Its last
patch adds deep sleep state handling to brcmf_pcie_remove() and hooks on the ring
lock that wake the device. A re-probe after a link reset runs that remove path on a
device that does not answer, and error_detected() only sets devinfo->state to DOWN
and leaves the deep sleep state alone. The series also adds its own re-probe after
a resume through platform firmware. Please check recovery with that series applied,
and make sure an error during resume cannot start both re-probes. Whichever series
is applied second will need a rebase.

The commit message says brcmf_pcie_reset() is not enough after a link reset
and the cover letter leaves the cause open. I would like to know which part of
the probe-time setup is missing before settling on a full re-probe.

The pci_err() line in brcmf_pcie_reprobe_worker() and the brcmf_err() line in
brcmf_pcie_slot_reset() are 81 columns, see the checkpatch warning.

Regards,
Arend
