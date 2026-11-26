Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703402;
	b=mrbtVnf4xC1VbyGsItUQK7IKZn9mQ3lc+tNqt1qu+j8mny7t8mbrb/IQpFYiqsyf2gr/
	 5jyQ03gvYL9+cFRdLrOpCJcB/OX1O3fabR4IZlR2+SHpZaAQZQoEvNXXwV08HUR/50e5w
	 O2qlyEJni5igDXC8K3pJQom29nBCBN4yHF9/0Lma/MhPHTtE/6IPEEcbUJ/2TAPEHnile
	 PeGzPmaLUGZRjDZ8jh9Wh7h8GLloyXbGsp9OVDq957sW/JpmgEK/EmB66E6s3DEvz7jh8
	 Y2rRjIxN5O/U6DdHeGvrmyuWiOaLqFM1DujfjAWgNzKoHQ5qb4a5zahPzc49HUySyqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703402;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=VjqQuEBBQvXUyQLlY4Gl4q1TSfCP6TKWu5ONTcrIr9c=;
	b=gi4lNlGf1WzVkYwdkxO3PcFhNnOqlmQD86VAuV7Ef3enboYwh5TSVq4HQJ28DnSQZylS
	 GgjdrwBofzDcOMNYjW8/q2jTbST2ZZwMZmgdyxZ+NCVHAELfH7smw6Y6rTleI/bnuzAgi
	 KwfsiGgWBz+DFjgMdTbMN3mW/M9ZeRRe8UodSrwgRN4nXymdY9crcFH2tdaVf7+UxMH/l
	 32Kx2m1tKKMDQl4peQsfl5fQrILXE3o4c1z5/V09Er4cryspR9mky6Z/DqM40DEwx9wDD
	 yZoNGAvgywf9BevIrWIDaBAiZE1iiVSp2Xhw5UMigSMCXmP212vfWUpPirZZkmO+QYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xo6m8cwr;
	arc=none smtp.remote-ip=74.125.82.98
Received: from mail-dl1-f98.google.com (mail-dl1-f98.google.com [74.125.82.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1B1606A690
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 14:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1B1606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Xo6m8cwr
Received: by mail-dl1-f98.google.com with SMTP id a92af1059eb24-15ea896ddc8so11673299c88.0
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703401; x=1796308201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjqQuEBBQvXUyQLlY4Gl4q1TSfCP6TKWu5ONTcrIr9c=;
        b=dRwy2JWImy6PO0fql47rYrUtQqEeKJOjU9NOLhS8ZPX/m/jXT/ebSeBQ546uJQb4RI
         B4rAGdOCNNjNJoKh4BovwN/QdEOCPmdtcypxj2T9DkaxIsu2Qx1L8q2soHAYUbt/31vN
         Ta6gOdAUqlyBq7gcIIEqOUuYEf9LUhwEdlPOKADyMpFmoCNv/hvycucRYmIbpaTuOPy3
         IPLEGToWgkjSdOojeuUZ5CvU8zvvM9/lPidn4TortaUUh7GOczg4COYnjxeEZzaSkaAH
         ZgPannGxEaTCFeY1qYrYmztoGGZBQWK/AyMO0P/chkvROQEs4fFM/5AKHxjZX/yFQHb/
         hjhw==
X-Forwarded-Encrypted: i=1; AL+hErFYaUfAkHs5N8EJ3pu+m/sQsQgOLGyK1HAncNAOp1n3ompCN+J7q8cUTjb2v3kHM7Q2nh2XXcHUCUE=@lists.linux.dev
X-Gm-Message-State: APuU4Z8FjsadhFdwgZiXcz2do2g3Z559cp2glnjwx/kcfHMazcTSBirF
	CDisut64Z+Ps39vYpUvqip6jLjIYOHskxNVNEvGzVtR7lvaOkc4r/7FG0934KXuXv61tC48d87/
	/oqat1hCEZFIjiMTC4jIDhIhcify2pEuDVrwfnIu9fHcvQx+b9Bltgts627I73yb9zIOU6HQ09T
	zzIzdy6W7FM2zfWWrhxRXkUrJ5dNL/6yNRLmzTIZgNwVBxU1ve/Jqz5/Jfh5s5VWiIxDNhCzN9R
	zJwHsmhZ45090BlQ83itw==
X-Gm-Gg: AZFdTZc6+X8xWuYq8QP9aYf31zUtaAFUOmVtpLbmFdM5WTub/THqzlofvKyA3/oAlOO
	5ne0RjSKyfIQfh5yRkK5acPtkd/xaJnTcdwv57fb0cjtzb+URj3XjSJ7ILPU27fjq1RFWUNU9Kp
	CH0NeRaZ0tb7/kZqDW9aojZbx8Z/jAtTQUSB1QfFYQrqkbwv7YvO7cLvYOAU3ituXGlCyGlkdF0
	54DQ0be6TvUbkmzA7FD2JiiN1lpMRdBjI33peIiJhTI7+nuDP1nAu+b9wrxAoQxesCQ1hPELvxs
	IflVGuGgvHyBZu3z/UeAI6GetR72ZJYbhM/+/ieFgCbXic95NSg4f/EPjFPN0Ilj+7yEek5tAFk
	xPVAe5Z9OH94yz7ITlhhFbIqElTIwIXBaLt6gEhijz7Lq0AlYUih1YvMGsZtx/a0K8fWSAuU5lg
	1odhXsQNA/ynm5OMmWT4rHwXEtucUscAxCRHyVmQQ=
X-Received: by 2002:a05:693c:638d:20b0:375:c862:31c with SMTP id 5a478bee46e88-38571816d35mr20877390eec.40.1795703400657;
        Thu, 26 Nov 2026 06:30:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-385677c01dcsm3321052eec.20.2026.11.26.06.30.00
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:30:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-53639e47be2so133284631cf.3
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703399; x=1796308199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjqQuEBBQvXUyQLlY4Gl4q1TSfCP6TKWu5ONTcrIr9c=;
        b=Xo6m8cwrNzmEyLAsm8ClKPglyEFcwPqrSWa+VA+RyI0zjWdIAxBBtYl/rj1ORfjiEF
         Iqvm6lRObtXbKmV4reNYkN2T4nB8b4pPLACGpLPxG45Tcui4S5QyBEG2KrxDus99Ey3F
         AmvpQS3BKsglW+qyupPi8nr/bjZjQ8l6wZSKg=
X-Forwarded-Encrypted: i=1; AL+hErHQbNFhQpPyun1qKTRmpesJX/J2Z1Q5srYowBVaI9L6vqqVTKuhWVl4n4fic8xY252NzdRaxig0+5I=@lists.linux.dev
X-Received: by 2002:a05:622a:90c:b0:55c:ec48:199d with SMTP id d75a77b69052e-55d76a904a4mr364421931cf.48.1795703398918;
        Thu, 26 Nov 2026 06:29:58 -0800 (PST)
X-Received: by 2002:a05:622a:90c:b0:55c:ec48:199d with SMTP id d75a77b69052e-55d76a904a4mr364421641cf.48.1795703398410;
        Thu, 26 Nov 2026 06:29:58 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm181098511cf.17.2026.11.26.06.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:58 -0800 (PST)
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
Subject: Re: [PATCH v2 5/5] wifi: brcmfmac: pcie: support inband device wake and deep sleep
Date: Thu, 26 Nov 2026 15:29:42 +0100
Message-ID: <20261126142942.881504-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111120748.23795-6-dev@deq.rocks>
References: <20261111120748.23795-6-dev@deq.rocks>
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

On Wed, 11 Nov 2026 13:07:48 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> The BCM4364 and BCM4377 firmware report inband deep sleep in the PCIe
> shared flags. The driver only advertises that it has no out-of-band
> device wake, which leaves deep sleep disabled. The firmware then stays
> awake and keeps its latency tolerance short enough to hold the package
> out of PC10.
>
> Advertise inband device wake when the firmware supports it and follow
> the handshake of the firmware. The device asks for deep sleep while
> device wake is deasserted, the host acknowledges it once it has nothing
> to send, asserts device wake before it uses the rings again and waits
> for the exit note, and deasserts device wake after 200 ms without ring
> writes. Hooks around the ring lock cover every host to device ring
> writer. A system suspend asserts device wake before D3_INFORM and
> acknowledges no deep sleep request until the resume.
>
> Tested on a MacBookPro15,1 (BCM4364) and a MacBookAir9,1 (BCM4377). The
> firmware enters and leaves deep sleep about 40 times a minute at idle
> with Wi-Fi associated, traffic and downloads work, and the package
> reaches PC10 without ignoring the latency tolerance of the Wi-Fi port.
>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>

This patch does not apply to wireless-next main: the struct brcmf_pciedev_info hunk
conflicts with the sig_name/fw_size/skip_reset_vector members added by "wifi:
brcmfmac: Load signed PCIe firmware images". Please rebase on wireless-next.

[...]

> ---
>  .../broadcom/brcm80211/brcmfmac/commonring.c  |  14 ++
>  .../broadcom/brcm80211/brcmfmac/commonring.h  |   5 +
>  .../broadcom/brcm80211/brcmfmac/pcie.c        | 233 +++++++++++++++++-
>  3 files changed, 249 insertions(+), 3 deletions(-)

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -892,17 +918,184 @@ brcmf_pcie_send_mb_data(struct brcmf_pciedev_info *devinfo, u32 htod_mb_data)

[...]

> +static void brcmf_pcie_ds_send(struct brcmf_pciedev_info *devinfo, u32 data)
> +{
> +	mutex_lock(&devinfo->ds_mutex);
> +	WRITE_ONCE(devinfo->ds_sender, current);
> +	brcmf_pcie_send_mb_data(devinfo, data);
> +	WRITE_ONCE(devinfo->ds_sender, NULL);
> +	mutex_unlock(&devinfo->ds_mutex);
> +}
> +

[...]

> +static void brcmf_pcie_ds_wake(struct brcmf_pciedev_info *devinfo)
> +{
> +	bool assert = false, wait;
> +
> +	if (brcmf_pcie_ds_skip(devinfo))
> +		return;
> +
> +	spin_lock(&devinfo->ds_lock);
> +	devinfo->ds_active++;
> +	if (devinfo->ds_state == BRCMF_PCIE_DS_SLEEP) {
> +		devinfo->ds_state = BRCMF_PCIE_DS_EXIT_WAIT;
> +		assert = true;
> +	}
> +	wait = devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT;
> +	spin_unlock(&devinfo->ds_lock);
> +
> +	if (assert) {
> +		brcmf_dbg(PCIE, "deep sleep: assert device wake\n");
> +		brcmf_pcie_ds_send(devinfo, BRCMF_H2D_HOST_DW_ASSERT);
> +	}
> +	if (!wait)
> +		return;
> +
> +	/* The exit note arrives through the interrupt thread itself */
> +	if (devinfo->in_irq) {
> +		usleep_range(1000, 1100);
> +		return;
> +	}
> +	if (wait_event_timeout(devinfo->ds_wait,
> +			       READ_ONCE(devinfo->ds_state) !=
> +			       BRCMF_PCIE_DS_EXIT_WAIT,
> +			       BRCMF_PCIE_DS_EXIT_TIMEOUT))
> +		return;
> +
> +	brcmf_err(dev_get_drvdata(&devinfo->pdev->dev),
> +		  "no deep sleep exit after device wake\n");
> +	spin_lock(&devinfo->ds_lock);
> +	if (devinfo->ds_state == BRCMF_PCIE_DS_EXIT_WAIT)
> +		devinfo->ds_state = BRCMF_PCIE_DS_AWAKE;
> +	spin_unlock(&devinfo->ds_lock);
> +}
> +

devinfo->in_irq is a device wide flag that is true whenever the interrupt thread is
running. Another thread (tx worker, ioctl, flowring worker) that gets here while the
interrupt thread is running takes this branch, sleeps 1 ms and writes the ring while
the device is still waking up. Please check that current is the interrupt thread (for
instance record it like ds_sender) instead of looking at in_irq.

The return value of brcmf_pcie_ds_send() is ignored here and in the ack paths. If the
write fails, every ring lock waits the full 500 ms for the exit note, or the state
says sleep while the device is awake. Please handle the failure.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -1821,6 +2021,10 @@ brcmf_pcie_init_share_ram_info(struct brcmf_pciedev_info *devinfo,
>  		if (shared->flags & BRCMF_PCIE_SHARED_DAR)
>  			host_cap |= BRCMF_HOSTCAP_H2D_DAR;
>  		host_cap |= BRCMF_HOSTCAP_DS_NO_OOB_DW;
> +		if (shared->flags & BRCMF_PCIE_SHARED_INBAND_DS) {
> +			host_cap |= BRCMF_HOSTCAP_DS_INBAND_DW;
> +			devinfo->ds_state = BRCMF_PCIE_DS_ALLOWED;
> +		}
>
>  		brcmf_pcie_write_tcm32(devinfo, sharedram_addr +
>  				       BRCMF_SHARED_HOST_CAP_OFFSET,

The cover letter says this relies on the mailbox over the control ring, but nothing
checks mb_via_ctl here. With the shared memory mailbox the wake and ack messages go
through a different path and I doubt the handshake holds. Please require mb_via_ctl.
Does the firmware want DS_NO_OOB_DW and DS_INBAND_DW both set? This also enables the
feature for every other firmware that sets the flag (BCM4378/4387/4388, CYW), which
were not tested. Please limit it to the tested chips or get it tested on the others.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2757,6 +2966,8 @@ brcmf_pcie_remove(struct pci_dev *pdev)
>  		return;
>
>  	devinfo = bus->bus_priv.pcie->devinfo;
> +	WRITE_ONCE(devinfo->ds_state, BRCMF_PCIE_DS_NONE);
> +	cancel_delayed_work_sync(&devinfo->ds_deassert_work);
>  	brcmf_pcie_bus_console_read(devinfo, false);
>  	brcmf_pcie_fwcon_timer(devinfo, false);
>

This makes all hooks a no-op but does not wake the device first. At idle the device
sleeps most of the time, so the ioctls and flowring deletes that brcmf_detach() sends
after this go to a sleeping device and time out. Also, ds_state is not changed under
ds_lock, so a thread that passed ds_skip() just before can still call
mod_delayed_work() after cancel_delayed_work_sync() (tx worker unlock path or the
interrupt thread exit note), and the work then runs after devinfo is freed. Please
wake the device before disabling, set NONE under ds_lock, check for it under the lock
before queueing the work, and cancel the work after the tx worker and interrupt
handling are stopped.

The series "wifi: brcmfmac: pcie: recover from fatal PCIe errors"
(https://patchwork.kernel.org/series/1203582/) re-probes the device after a fatal
PCIe error with device_reprobe(), so brcmf_pcie_remove() then runs on a device that
just had its link reset and does not answer. Waking the device first would stall
there, and the ring lock hooks would wait on it while devinfo->state is already
DOWN. Please make the wake in remove and the ring lock hooks give up when the
device is not up. Whichever series is applied second will need a rebase.

[...]

> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -2811,6 +3022,15 @@ static int brcmf_pcie_pm_enter_D3(struct device *dev)
>  	brcmf_pcie_fwcon_timer(devinfo, false);
>  	brcmf_bus_change_state(bus, BRCMF_BUS_DOWN);
>
> +	if (devinfo->ds_state != BRCMF_PCIE_DS_NONE) {
> +		spin_lock(&devinfo->ds_lock);
> +		devinfo->ds_suspend = true;
> +		spin_unlock(&devinfo->ds_lock);
> +		cancel_delayed_work_sync(&devinfo->ds_deassert_work);
> +		brcmf_pcie_ds_wake(devinfo);
> +		brcmf_pcie_ds_idle(devinfo);
> +	}
> +
>  	devinfo->mbdata_completed = false;
>  	brcmf_pcie_send_mb_data(devinfo, BRCMF_H2D_HOST_D3_INFORM);
>

ds_suspend is not cleared when brcmf_pcie_pm_enter_D3() fails further down (the
WoWL D3 timeout returns -EIO). The PM core does not resume this device then, so no
deep sleep request is acked anymore and the deassert work never runs again. Please
clear it on that error path.

Regards,
Arend
