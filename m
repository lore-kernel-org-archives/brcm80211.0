Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923314;
	b=VCZUbseXQnCwSgw5AWiBDz2XwnWMhxwQibCQpc6ZVcAJOjSOzCsHlTrbs595T8g4oOmx
	 FCEyFIgIf+ArWpvL9zS1aDbbxWldykwzNyWZplah/qtc9e33Yl1aCv/2G3nrGNYl34XPQ
	 rlE2esEVpb9dsPLZiBk5WyWj3TINtF6JBcOD/XhKrSsPV2tDQeIvLS46eWdjD+81/+bDg
	 C5UVEDT1FrUnwnYuv35os0GEfIopHh1rNM6e7wbX5GGYsgiwY7kTyGtu7s+aIjl5yrSSx
	 AJSkCR0h3YfKiCFKYH7+P+FDgtuozWUfKHf9orYoiHHk4fwAOr+OaINF3jPbWoa8qfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923314;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=tDOwlNUBBwdRYZAyLsugLYWbl6R/LlrxGs9sSAJDnx0=;
	b=HiQcS0ZF64IF+h+fHAZ9EGJ/FjelADjOWpu/fpvPKB/1buNxLnbWN+poEbU+L5XPwQpm
	 4ZAQWCdN6hI+J99KZb5166hJJA06pFvQu2nNrGahqLvRl5nGznnN8swEz+TfByIsaZovb
	 NchziVlOs9FG5iq1Ao1B1CE/vRjV2HPLMVQ4vXuBbCDL9kLCjDiOfKlXSBV9fuet4sGQ9
	 HFyi7CLR9pLM1/INeplSKwuecPBwcADFUcBh/fr0FR6PF/rdKXwIbNXps2fQ/fdXKO7ml
	 KuUOW2OysxYidjgo+f8lUJa2MDsr17VaDhLWvZDL87tCwUwsPe69UBhGsWAKxg2TcMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ji3yPKfD;
	arc=none smtp.remote-ip=209.85.210.99
Received: from mail-ot1-f99.google.com (mail-ot1-f99.google.com [209.85.210.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9BD606A337
	for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 13:48:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C9BD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Ji3yPKfD
Received: by mail-ot1-f99.google.com with SMTP id 46e09a7af769-862b090e41eso1627550a34.0
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 05:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923313; x=1795528113;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tDOwlNUBBwdRYZAyLsugLYWbl6R/LlrxGs9sSAJDnx0=;
        b=G8P6om3E5qc7clt0dvQRAUPTlsUVgviC7M6OdjxgR/2J/KN+ZnXPxtIf9CBqhIyd4V
         0TT7tuti+6fi4g7zfzcUwTyZsNqHk9eFufnQLhIqTk9+cHdWbrqYLDQ6yK20j1jr7Ztj
         6/x4HTbSoBXW/tdpWy2UGBDbin13TRgcdUtnhH6gv+jY8hliSNHXjEfr1xeD2ALaIEFy
         vMljXgGrKIW3tp3HSBig3hruNvbcO3ItLqrhL8h7Z+tppW+65hcdlHDsrNctgHqac3np
         5+8cwm1ttlduS5UTu8YOnLlqroMYIX1qV4aNoWzxyYCl1cMxZfdSk8a6Fcnc8GCSbsRz
         joMw==
X-Forwarded-Encrypted: i=1; AL+hErGfUtjVIDyJmYALr+2pKai+THUTC5mH8gpadQoMOyGNqxADEZAof/ya4u6zMS4cdKSrD9dRWt+3un8=@lists.linux.dev
X-Gm-Message-State: APuU4Z9iSAfEOm2CCTDudKsd55E6uciMBDKGqqqFd5XWI5SXUskvhwfL
	Irgf6ChsXKk17r0cpQ8T3LrmjEdWNcU+KxGcA0DiLxYTI8SjFpfrj0Ji5hYw/Bf10A/EwYHm/Ky
	8IxnXTYF0hPVG1aczG1D12mRhC82UDNzZn+oRlz6PBYdwi7qKMI95SBLcPh9veQTwMPpK+OhH/k
	6A9rojgZjLwEw3rPwoiyNRDIShGsdZlW0QyAdOmgDYcbZl0rR3DRKFNKU8FxywPbtAdxgXw+9/A
	ia85EMjCKQIgWfwotiCgg==
X-Gm-Gg: AYBFou3wzaRMb2sVMxsoJvoDYce/dT/fveLDvQh8NXNfCaM+ICDgoej3IXSE1Dvfg7s
	VNOQgE/Lg7wP97tcYXcdVGjUO8FpYGWn5RdbD//ZNC5Ns05cVxKfVZB1AfMTcJ2S75qM68emV/q
	8Mf313Pi533G48J4WSZNOXJfD0lhVf5kiUMRW7KG90Deom6X/94F5x21ESp3qcWeCBG7IaJX9Yd
	MhUWgb36YMn20uL74BtiWKNADWpylXt/vDpA08myDEAwFqlCvIkMbGB0TEzKIqdaY+14E2cHpw2
	9Gdzq747xPwN7PYZ5lpxjh/NTgp1Avkj7Zu6+K5gn1LcRMr3hU61e6kWxY+33+aY8N4wrr7hgkX
	kTczzYzZ2WDtytwRW56XzSCBc89jUHs8mKR6Q51GjMKBvcw//bG40iyrvRBFbgaomBICJkZMlCV
	zDoGFKirAD79sxRZXayEUiZFkYeNOsRP80awAatIU=
X-Received: by 2002:a05:6830:82b5:b0:862:a48e:24cd with SMTP id 46e09a7af769-862a48e25aamr8349243a34.20.1794923312935;
        Tue, 17 Nov 2026 05:48:32 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-26.dlp.protect.broadcom.com. [144.49.247.26])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-8629bdf5ce7sm144061a34.13.2026.11.17.05.48.32
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 05:48:32 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-92109408212so8201756d6.1
        for <brcm80211@lists.linux.dev>; Tue, 17 Nov 2026 05:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794923312; x=1795528112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tDOwlNUBBwdRYZAyLsugLYWbl6R/LlrxGs9sSAJDnx0=;
        b=Ji3yPKfDE10+OM7yD0FwL48a9xIs87zv/tL4Ex1aW4Yju8JU7HmaUHrLVeTN9BqWvl
         zVXAON5HBJGYIkNxGePVD6EuPmygHHSoek0YMg45hvwGekqOE0qZ915bEsEJ124FB9F/
         Vyqlb/sYeL5UZUGvZOW6KfloXVsCMSNRLfr40=
X-Forwarded-Encrypted: i=1; AL+hErFUM6asOp3fkrRy6pAgvpB5MPwgM8xrRdxcuzHF1iIq7rfjSvfPlUtFIoTM5L311jsP/NUs+DxTEeQ=@lists.linux.dev
X-Received: by 2002:a05:6214:4589:b0:91c:6e6a:f1ad with SMTP id 6a1803df08f44-91f23f21dcdmr220710816d6.0.1794923311858;
        Tue, 17 Nov 2026 05:48:31 -0800 (PST)
X-Received: by 2002:a05:6214:4589:b0:91c:6e6a:f1ad with SMTP id 6a1803df08f44-91f23f21dcdmr220710206d6.0.1794923311337;
        Tue, 17 Nov 2026 05:48:31 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23dae6c3sm110641136d6.38.2026.11.17.05.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:48:30 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Max Engel <dev@maxengel.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH v2] wifi: brcmfmac: request bus reset when the device is unresponsive after wake
Date: Tue, 17 Nov 2026 14:48:26 +0100
Message-ID: <20261117134826.1652889-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <179230294232.2815959.4255945147086159884@maxengel.com>
References: <179230294232.2815959.4255945147086159884@maxengel.com>
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

On Sun, 18 Oct 2026 05:55:42 +0000, Max Engel <dev@maxengel.com> wrote:
> That worker's only SDIO trigger today is the firmware-halt mailbox
> interrupt (HMB_DATA_FWHALT), which a chip that is off the bus can never
> deliver. Request the same reset from the KSO wake path when the failure
> is conclusive: wake direction, the wait given up with an error, and the
> CSR reading back all-ones.

[...]

> @@ -771,6 +771,20 @@ brcmf_sdio_kso_control(struct brcmf_sdio *bus, bool on)
>  	if (try_cnt > MAX_KSO_ATTEMPTS)
>  		brcmf_err("max tries: rd_val=0x%x err=%d\n", rd_val, err);
>
> +	/* A wake attempt that gives up, by exhausting the KSO retries or by
> +	 * bailing out on consecutive access errors, with the sleep CSR
> +	 * reading back all-ones means the device has dropped off the bus,
> +	 * e.g. it lost state across a system suspend despite
> +	 * keep-power-in-suspend. No in-band recovery is possible. Request
> +	 * the bus reset the firmware-halt path uses, which a device that is
> +	 * off the bus can never signal itself. Skip the coredump: it cannot
> +	 * succeed over a dead bus.
> +	 */
> +	if (on && err && rd_val == 0xff) {
> +		brcmf_err("device unresponsive after wake, requesting bus reset\n");
> +		brcmf_fw_crashed(&bus->sdiodev->func1->dev, false);
> +	}
> +
>  	if (on)
>  		sdio_retune_release(bus->sdiodev->func1);

sdio_readb() returns 0xFF whenever the CMD52 fails, so with err set rd_val is
0xff by construction. The condition therefore means "the wake loop ended with
an access error", not "the CSR read back all-ones", and it cannot tell a
device that is off the bus (-ETIMEDOUT) from e.g. a CRC error or another bus
error. Also err may stem from the final write rather than the read that gave
rd_val. A full power cycle is a heavy response, so please either narrow the
condition (e.g. on -ETIMEDOUT) or fix the comment/commit message and justify
why resetting on any access error is acceptable.

Also, the new call can be reached from the bus reset itself. The reset
worker runs brcmf_sdio_bus_reset() -> brcmf_sdiod_remove() ->
brcmf_sdio_remove() -> brcmf_detach() -> brcmf_bus_stop() ->
brcmf_sdio_bus_stop(), which wakes the device with brcmf_sdio_bus_sleep()
and so ends up in brcmf_sdio_kso_control(). On a device that is off the bus
that wake fails, and brcmf_fw_crashed() is called from the reset worker.
If remove runs at the same time, brcmf_bus_cancel_reset_work() holds
bus_reset_lock while it waits for the worker in cancel_work_sync(), and the
worker blocks on that lock in brcmf_bus_schedule_reset(): deadlock. Without
a concurrent remove the worker re-arms itself while brcmf_detach() is still
running, and the queued work then points into the brcmf_pub that
brcmf_free() releases. The data worker is fine, because remove cancels it
before taking the lock. Suggest to only request the reset when the device
is up, e.g. skip it when sdiodev->state is not BRCMF_SDIOD_DATA, which
brcmf_sdiod_remove() has cleared by then. The extra "Firmware has halted or
crashed" message printed by brcmf_fw_crashed() is a bit misleading for this
case too.

[...]

Regards,
Arend
