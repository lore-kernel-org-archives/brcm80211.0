Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689DF53CA9A
	for <brcm80211@lists.linux.dev>; Tue, 22 Sep 2026 13:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790084046; cv=none; b=CYSe99sRKrS315QrHO4FO6RJg+zWlYsOqbJS9LaGxnk3GIMPkop+x0aA8La2rC821tAGaPvJ8cwdBIBPaDA+31UUHeCuzZi21dkgz+o6DUDccDPF/QCA4Mlp5AgoT7ym94frqiJ5QCPrqo9Or5920OKrkU9CGyhv7ZUoHhwCGB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790084046; c=relaxed/simple;
	bh=XqJp51axDbzjgUmwTrSA+C0IjWyREkj8qWU3tTNRHtM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q0hGYULW21OSg+hBKEkWAbteMu5BdXiwXxbp5N7uK+Nt03M9GatKSlVIr/onR4cFP6zHa8PoKEnr+UxtdtL89Bo4XOa/lA5KZVkw8yZXLBOkJD/nsMP+Eu/gbD39aeXrBeGhMxAkAf0sHpvaalWPhK2rJtV+3RcymnOoEASoYak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=znHDy8M2; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="znHDy8M2"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-530c602630bso50609231cf.3
        for <brcm80211@lists.linux.dev>; Tue, 22 Sep 2026 06:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790084040; x=1790688840; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hPazgcC6xiRmlEG//kVU4rPb8z2E1Fxa+1KGjyuQV8s=;
        b=znHDy8M2K5oN8kbDuBopLRTZb8nyFqamEVI5kAIKJ8XYRNwVSjSaueZB9tjfHwHUKh
         m91eeXya1c6eoEpSs52g/EDoYuiTS1Y2hGgPbkyhBWL3BkFPvrJ8v8NMLG2rj92kNgzQ
         Zz4Uup90BYVTUdSoc5ba/heJTrpsMKqcVGdKsb33tQ1H8iW8wDk2NJM5AKkp0OaJUR7t
         y8+07jynzkrazzoe9IEEiuDE3sgcn5pK1jF51uN6pCWdMolibFbGVyIlbIBDm3Zcclbx
         xlGrPYtCp92ykVgKjH/bnPA98/nbZr7J0evR3PzL3MkPcUuyUnptxVmviiwr23wYK6lk
         oWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790084040; x=1790688840;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPazgcC6xiRmlEG//kVU4rPb8z2E1Fxa+1KGjyuQV8s=;
        b=sBFT4Xi2upPqde2Bl+1SllRw9DtdYWmB4ijVPqsdLilEdNhbKyuywSSwUFCp9JBDHI
         biEI6lnwrL/0sMmHOl9MrWqzaZFRr9PYwRjquUsIvG4CFEewA2NOjhxwVDdNU2smYySz
         LljNMRjnWMW6aJlprpIQOV1uU7YfYoc1G5heUWq9OwTQlBcR0BaDkvdRDEkkP/pQ5CPs
         EGYiY++5qRHwBWw7lEUudepqz/QrCeVYGIdeztDQH6n/PZIBKKhXOPTBpYZ4x2fTSJE2
         8XK2te8gnJhk8BnzqgY1H4UCTDldg0Cdd2+MLhkeooZFZmxfq+Tqziam8RjMWSmwwDZm
         dgBA==
X-Forwarded-Encrypted: i=1; AKwUvBwfhyA/LurHlK4pEvYjasS6ueW/4TyDjeaIX/K55jfc7CvJhYsQ6srUQczxSM/NfxtdRZAjvYxXb4A=@lists.linux.dev
X-Gm-Message-State: AFuF++mQrzhhwF9GUZJOD6q4ZDGH5hvYnSJQ0AOc0DjHu/h6UcBdOdxh
	V00ohq59vbKA3YaME6xFSENYii95x30Yx0D7MQaVsbyV1Py8GJwrDEfG6P2nOXlo8klY+7RzPsq
	Ln3Q36j3V2b145HHgI0gQjzZlOgbmnMnkqiORmBl+A5LkYU48uuu2SmI=
X-Gm-Gg: AYBFou2Zx680o1ZMccqXEXjDo26/w9ZqdipOwZ8Q9fGdNOIMGeDPULrQmNL6Q87hU62
	z9faYqb8jjh9UJme3BtpLQjtbi4sNu7RvGAQPfa+tBtZS4PrGCLk64tnpw4XZ1VUB/wJojqi87e
	MLM0skHLNEgQ0vx256yFQZ3xsiq9na94JttIfZDuptKscqJXCYcRX2XZsmJDxWTcDINpJGiAbU/
	oTUiWzWvbagQ5EkKOb/QY8opx0vG/rHy/HGYU2T9jJSzNh6I/zi8mSLS254s5BW3RtKPyu5Sy8l
	iyiPI57tBDuyIA7TBwbULhgvXwyopb0JxFp9KNipj1WHLC9jMkkOIOf7DP64b8j+LHTUESRVVYE
	x5NBhRAJch07N7iV2Ua/d84va9w5Mm9rdNf6TlmaNtLam8wwIsB+VwS4Aw23uI+oQYgNMsFjnUd
	WuL546e/0lCoenUSCATSEezGtdCor8cI0y9tt7QVJXu6JhmkR7tK2x1ZM9G/RUVnF2v/hpfG+r1
	wdm
X-Received: by 2002:a05:622a:413:b0:532:9add:cddc with SMTP id d75a77b69052e-532dd58e04cmr36179231cf.65.1790084038986;
        Tue, 22 Sep 2026 06:33:58 -0700 (PDT)
Received: from [10.200.233.210] ([71.163.254.246])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532e1995f8esm12967981cf.31.2026.09.22.06.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 06:33:58 -0700 (PDT)
Message-ID: <9eaaf97f-1a1c-4059-b77b-0ce6e399b691@brivo.com>
Date: Tue, 22 Sep 2026 09:33:53 -0400
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wifi: brcmfmac: Fix firmware requests racing against
 SDIO removal
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
 linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>, brcm80211@lists.linux.dev,
 linux-kernel@vger.kernel.org, brcm80211-dev-list.pdl@broadcom.com,
 Franky Lin <franky.lin@broadcom.com>,
 "John W. Linville" <linville@tuxdriver.com>
References: <20260921211817.2432341-1-sanderson@brivo.com>
 <20260921211817.2432341-5-sanderson@brivo.com>
Content-Language: en-US
From: Sean Anderson <sanderson@brivo.com>
In-Reply-To: <20260921211817.2432341-5-sanderson@brivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 9/21/26 5:18 PM, Sean Anderson wrote:
> brcmf_sdio_firmware_callback can race with device removal. If this
> happens it can re-register IRQs, dereference NULL pointers, and cause
> all sorts of havoc. Prevent this by canceling any outstanding firmware
> request as the first step of the removal process.
> 
> When canceling the firmware request, we primarily need to ensure fwctx
> remains valid for all our calls to request_firmware_nowait_cancel. If we
> let it get free'd early then it could get re-used for some unrelated
> firmware request. To avoid this, we follow the same pattern that
> firmware_loader does. But while firmware_loader needs a spinlock, we can
> get away with a single pointer:
> 
> - When ctxp is NULL, then we can't be canceled
> - When *ctxp == fwctx, we're still alive
> - When *ctxp == NULL, someone else has canceled the request (or we have
>    run our natural course).
> - Whoever clears ctxp is responsible for freeing fwctx.
> 
> There can be up to NR_CPUS requests in-flight at any given time, as each
> (alt) firmware request can create a new firmware request. Eventually,
> one of them will see that ctxp is cleared and stop spawning additional
> requests.
> 
> If the firmware load fails while we are removing the device, we can no
> longer attempt to call device_release_driver. This will deadlock. We
> can't do this asynchronously either since we run the risk of releasing a
> totally different driver/device combo. We could techincally do this by
> dropping device_lock before waiting for the firmware to cancel, but that
> seems like a major headache (we would need to make ctxp a separate
> reference-counted allocation).
> 
> I also implemented this fix for PCIe but I have only build-tested it.
> I didn't touch USB as it already uses a completion-based system to
> determine when it's OK to remove the driver. I didn't go with this
> approach because we could wait indefinitely for the firmware request to
> complete (such as if the firmware is on a slow device or loaded by
> userspace).
> 
> Fixes: bd0e1b1d380e ("brcmfmac: use asynchronous firmware request in SDIO")
> Signed-off-by: Sean Anderson <sanderson@brivo.com>
> ---
> 
>   .../broadcom/brcm80211/brcmfmac/bcmsdh.c      |  7 ++++-
>   .../broadcom/brcm80211/brcmfmac/bus.h         |  2 ++
>   .../broadcom/brcm80211/brcmfmac/firmware.c    | 26 ++++++++++++++++---
>   .../broadcom/brcm80211/brcmfmac/firmware.h    | 16 +++++++++++-
>   .../broadcom/brcm80211/brcmfmac/pcie.c        | 11 +++++---
>   .../broadcom/brcm80211/brcmfmac/sdio.c        |  8 +++---
>   .../broadcom/brcm80211/brcmfmac/usb.c         |  6 +++--
>   7 files changed, 63 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
> index 71c2f99cdb711..39916f5a699dd 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bcmsdh.c
> @@ -1126,7 +1126,12 @@ static void brcmf_ops_sdio_remove(struct sdio_func *func)
>   	if (bus_if) {
>   		sdiodev = bus_if->bus_priv.sdio;
>   
> -		/* start by unregistering irqs */
> +		/* Cancel any outstanding firmware request, as it may try to
> +		 * call brcmf_sdiod_intr_register.
> +		 */
> +		brcmf_fw_cancel(sdiodev->dev, &bus_if->fwctx);
> +
> +		/* Now we can unregister irqs */
>   		brcmf_sdiod_intr_unregister(sdiodev);
>   
>   		if (func->num != 1)
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bus.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bus.h
> index 9371c1489948c..81c17a8c235cc 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bus.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/bus.h
> @@ -157,6 +157,7 @@ struct brcmf_bus_stats {
>    * @chip: device identifier of the dongle chip.
>    * @chiprev: revision of the dongle chip.
>    * @fwvid: firmware vendor-support identifier of the device.
> + * @fwctx: firmware request cancellation context
>    * @always_use_fws_queue: bus wants use queue also when fwsignal is inactive.
>    * @wowl_supported: is wowl supported by bus driver.
>    * @ops: callbacks for this bus instance.
> @@ -178,6 +179,7 @@ struct brcmf_bus {
>   	u32 chip;
>   	u32 chiprev;
>   	enum brcmf_fwvendor fwvid;
> +	void *fwctx;
>   	bool always_use_fws_queue;
>   	bool wowl_supported;
>   	bool removing;		/* device removal in progress; quiesce async work */
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
> index 22ff326f1924a..d1da65155e544 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.c
> @@ -459,6 +459,7 @@ struct brcmf_fw {
>   	u32 curpos;
>   	unsigned int board_index;
>   	void (*done)(struct device *dev, int err, struct brcmf_fw_request *req);
> +	void **ctxp;
>   };
>   
>   #ifdef CONFIG_EFI
> @@ -693,7 +694,7 @@ static void brcmf_fw_request_done(const struct firmware *fw, void *ctx)
>   		fwctx->req = NULL;
>   	}
>   	fwctx->done(fwctx->dev, ret, fwctx->req);
> -	kfree(fwctx);
> +	kfree(xchg(fwctx->ctxp, NULL));
>   }
>   
>   static void brcmf_fw_request_done_alt_path(const struct firmware *fw, void *ctx)
> @@ -703,7 +704,7 @@ static void brcmf_fw_request_done_alt_path(const struct firmware *fw, void *ctx)
>   	const char *board_type, *alt_path;
>   	int ret = 0;
>   
> -	if (fw) {
> +	if (fw || !READ_ONCE(*fwctx->ctxp)) {
>   		brcmf_fw_request_done(fw, ctx);
>   		return;
>   	}
> @@ -755,7 +756,8 @@ static bool brcmf_fw_request_is_valid(struct brcmf_fw_request *req)
>   
>   int brcmf_fw_get_firmwares(struct device *dev, struct brcmf_fw_request *req,
>   			   void (*fw_cb)(struct device *dev, int err,
> -					 struct brcmf_fw_request *req))
> +					 struct brcmf_fw_request *req),
> +			   void **ctxp)
>   {
>   	struct brcmf_fw_item *first = &req->items[0];
>   	struct brcmf_fw *fwctx;
> @@ -776,6 +778,8 @@ int brcmf_fw_get_firmwares(struct device *dev, struct brcmf_fw_request *req,
>   	fwctx->dev = dev;
>   	fwctx->req = req;
>   	fwctx->done = fw_cb;
> +	fwctx->ctxp = ctxp;
> +	WRITE_ONCE(*ctxp, fwctx);
>   
>   	/* First try alternative board-specific path if any */
>   	if (fwctx->req->board_types[0])
> @@ -799,6 +803,22 @@ int brcmf_fw_get_firmwares(struct device *dev, struct brcmf_fw_request *req,
>   	return 0;
>   }
>   
> +void brcmf_fw_cancel(struct device *dev, void **ctxp)
> +{
> +	struct brcmf_fw *fwctx;
> +
> +	fwctx = xchg(ctxp, NULL);
> +	if (!fwctx)
> +		return;
> +
> +	/* Keep canceling requests until they see that we cleared ctxp */
> +	while (request_firmware_nowait_cancel(dev, fwctx,
> +					      brcmf_fw_request_done_alt_path))
> +		;
> +	request_firmware_nowait_cancel(dev, fwctx, brcmf_fw_request_done);
> +	kfree(fwctx);
> +}
> +
>   struct brcmf_fw_request *
>   brcmf_fw_alloc_request(u32 chip, u32 chiprev,
>   		       const struct brcmf_firmware_mapping mapping_table[],
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.h
> index 4002d326fd21b..932899d4086b3 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.h
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/firmware.h
> @@ -87,9 +87,23 @@ brcmf_fw_alloc_request(u32 chip, u32 chiprev,
>    * Request firmware(s) asynchronously. When the asynchronous request
>    * fails it will not use the callback, but call device_release_driver()
>    * instead which will call the driver .remove() callback.
> + *
> + * ctxp is a (pointer to an) opaque pointer that may be passed to
> + * brcmf_fw_cancel().
>    */
>   int brcmf_fw_get_firmwares(struct device *dev, struct brcmf_fw_request *req,
>   			   void (*fw_cb)(struct device *dev, int err,
> -					 struct brcmf_fw_request *req));
> +					 struct brcmf_fw_request *req),
> +			   void **ctxp);
> +
> +/**
> + * brcmf_fw_cancel() - Cancel an outstanding firmware request
> + * @dev: Device requesting the firmware
> + * @ctxp: Opaque context pointer filled in by brcmf_fw_get_firmwares()
> + *
> + * Cancel an outstanding firmware request identified by @dev and @ctxp, which
> + * should be the same as passed to brcmf_fw_get_firmwares().
> + */
> +void brcmf_fw_cancel(struct device *dev, void **ctxp);
>   
>   #endif /* BRCMFMAC_FIRMWARE_H */
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> index 55f4d7b970f28..9eae712b0d98c 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c
> @@ -1555,6 +1555,8 @@ static int brcmf_pcie_reset(struct device *dev)
>   	struct brcmf_fw_request *fwreq;
>   	int err;
>   
> +	brcmf_fw_cancel(dev, &bus_if->fwctx);
> +
>   	brcmf_pcie_intr_disable(devinfo);
>   
>   	brcmf_pcie_bus_console_read(devinfo, true);
> @@ -1572,7 +1574,8 @@ static int brcmf_pcie_reset(struct device *dev)
>   		return -ENOMEM;
>   	}
>   
> -	err = brcmf_fw_get_firmwares(dev, fwreq, brcmf_pcie_setup);
> +	err = brcmf_fw_get_firmwares(dev, fwreq, brcmf_pcie_setup,
> +				     &bus_if->fwctx);
>   	if (err) {
>   		dev_err(dev, "Failed to prepare FW request\n");
>   		kfree(fwreq);
> @@ -2231,7 +2234,6 @@ static void brcmf_pcie_setup(struct device *dev, int ret,
>   	brcmf_err(bus, "Dongle setup failed\n");
>   	brcmf_pcie_bus_console_read(devinfo, true);
>   	brcmf_fw_crashed(dev);
> -	device_release_driver(dev);
>   }
>   
>   static struct brcmf_fw_request *
> @@ -2554,7 +2556,8 @@ brcmf_pcie_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>   		goto fail_brcmf;
>   	}
>   
> -	ret = brcmf_fw_get_firmwares(bus->dev, fwreq, brcmf_pcie_setup);
> +	ret = brcmf_fw_get_firmwares(bus->dev, fwreq, brcmf_pcie_setup,
> +				     &bus->fwctx);
>   	if (ret < 0) {
>   		kfree(fwreq);
>   		goto fail_brcmf;
> @@ -2595,6 +2598,8 @@ brcmf_pcie_remove(struct pci_dev *pdev)
>   	brcmf_pcie_bus_console_read(devinfo, false);
>   	brcmf_pcie_fwcon_timer(devinfo, false);
>   
> +	brcmf_fw_cancel(bus->dev, &bus->fwctx);
> +
>   	devinfo->state = BRCMFMAC_PCIE_STATE_DOWN;
>   	if (devinfo->ci)
>   		brcmf_pcie_intr_disable(devinfo);
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> index 381801af3ac98..1c32fe5828a2f 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c
> @@ -4417,8 +4417,6 @@ static void brcmf_sdio_firmware_callback(struct device *dev, int err,
>   	sdio_release_host(sdiod->func1);
>   fail:
>   	brcmf_dbg(TRACE, "failed: dev=%s, err=%d\n", dev_name(dev), err);
> -	device_release_driver(&sdiod->func2->dev);
> -	device_release_driver(dev);
>   }
>   
>   static struct brcmf_fw_request *
> @@ -4546,7 +4544,8 @@ int brcmf_sdio_probe(struct brcmf_sdio_dev *sdiodev)
>   	}
>   
>   	ret = brcmf_fw_get_firmwares(sdiodev->dev, fwreq,
> -				     brcmf_sdio_firmware_callback);
> +				     brcmf_sdio_firmware_callback,
> +				     &sdiodev->bus_if->fwctx);
>   	if (ret != 0) {
>   		brcmf_err("async firmware request failed: %d\n", ret);
>   		kfree(fwreq);
> @@ -4581,6 +4580,9 @@ void brcmf_sdio_remove(struct brcmf_sdio *bus)
>   			bus->watchdog_tsk = NULL;
>   		}
>   
> +		brcmf_fw_cancel(bus->sdiodev->dev,
> +				&bus->sdiodev->bus_if->fwctx);
> +
>   		/* De-register interrupt handler */
>   		brcmf_sdiod_intr_unregister(bus->sdiodev);
>   
> diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> index b41949a9bdc8e..e8c0db0c82689 100644
> --- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> +++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/usb.c
> @@ -1306,7 +1306,8 @@ static int brcmf_usb_probe_cb(struct brcmf_usbdev_info *devinfo,
>   	}
>   
>   	/* request firmware here */
> -	ret = brcmf_fw_get_firmwares(dev, fwreq, brcmf_usb_probe_phase2);
> +	ret = brcmf_fw_get_firmwares(dev, fwreq, brcmf_usb_probe_phase2,
> +				     &bus->fwctx);
>   	if (ret) {
>   		brcmf_err("firmware request failed: %d\n", ret);
>   		kfree(fwreq);
> @@ -1524,7 +1525,8 @@ static int brcmf_usb_reset_resume(struct usb_interface *intf)
>   	if (!fwreq)
>   		return -ENOMEM;
>   
> -	ret = brcmf_fw_get_firmwares(&usb->dev, fwreq, brcmf_usb_probe_phase2);
> +	ret = brcmf_fw_get_firmwares(&usb->dev, fwreq, brcmf_usb_probe_phase2,
> +				     &devinfo->bus_pub->bus->fwctx);

This should be devinfo->bus_pub.bus->fwctx. Forgot to add the hunk before sending.

--Sean

>   	if (ret < 0)
>   		kfree(fwreq);
>   

