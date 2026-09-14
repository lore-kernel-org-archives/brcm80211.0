Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD1F1A5BAE
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 18:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411378; cv=none; b=ePA2c7/e5cUZ9VLGz0xu409sO8d3Qq7thzVq4Qma96dHHQm+fg77rzh8le+WHxIbKPaqM8/mWyEztDovwRBH0afkKrslls0Qb5SS3LQzCoRoYlRVhAphy1IDDuqwEck58GmJ9oveT93FoWvQAzlHSjjh6+CwNFnE1/fHILrVhTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411378; c=relaxed/simple;
	bh=Ndw6hik3x/AoZoF1Io5lferB93Yj0K1/+VbsvX2dnC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Olaoj4M2vJqGbSQbLGKcGe1Rq3iYw2tvVDU+1j0gsMOQhq2+hBUUxQVbZQOpmh6I3tASJZU1upK1xWt8zwivBy5SSQX/XapGiznUWRDUbGmy9rLUCIiLbYMoYfxlXVpkGG62ot2AjFSLSgxocBnzHFzxGvYrCzeoYEnKa4wHeYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=chizRkl5; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="chizRkl5"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3969e82ff8fso2776638a91.0
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 11:42:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411375; x=1790016175;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3geujkzCqEAatEWbaDVNzshK13FVbc1sKj1PBNVHXWU=;
        b=W/OO8pwdkek2in8dosVYqKGy2PS7UG/aBEnPAZGnJeH0nn0k1ZLAYg0nJHiwgnOcwy
         7zOBfbMs8mHixsyX1v+B268Nmn7zghHIMTfF5nmA3Wusdv16rZpOyCBifL3oO/jBnrEv
         HnBDkpzY0+/UJGCvRcH13lvVO4pXGXnM3exlWkgaJm65jQLUEpdi5/v/fCECiKcETkgn
         MNeKClHi0tbx1P/bYLq9tOOPbIjNeC4HXiof8vnaTK/k5YXyLmSUZiQiwj4BgfBOi5S6
         5wvqvtA7FCxABOZ4YGpdNDMDyCuSgFfbIcL6uIIwMux/tPRmjJBiU4X5GFeuP9Jbaz3Q
         lpEA==
X-Forwarded-Encrypted: i=1; AKwUvBwX72scvqDSruH14QYg/DX+HEfdRnd+j36iz/aXyaVAFQpdHMqzw7/0v0/GZnDvbS+Bh5aPUD47N1w=@lists.linux.dev
X-Gm-Message-State: AFuF++mx+5EiX1QEYLxY2c7671ZZZCVWikNNDRdS4YJ5qUYsN39hSbui
	Gwf5GiI3XRT8pUjINRCAeAVja7WHEdc+9U/ZjrGFggqjOFFWuUMmOCerxUjM8dQWersX4HOPaDg
	3N/4DOVlW7CRaT/JUGzCsH+kMmmtFaY7H59nWlkOCBPVyDM96N044L8wLJvkWjM5QImSzLsnJc+
	LQvm7YMRQicyenN+T6ZjnS5yvtCgDVhvXavInDfOcRetVk4242ZrjsHFPLLrkmPSZsSmatdc2jx
	0wBtQMBQBcog6kuAOM6N7Gb
X-Gm-Gg: AYBFou1C4swk6YrJPVUcL2Sd6kVRtoDx+oD7L60soRDeJn89po7exoKYAg2S8bzYv4E
	lLkRWPwZtwVMuXlSsIdMeBeQtJ2k3FOxSsbkURgZR672m+uTl0rKnTc8VTtrWCFHXdM0V0LBXpg
	jLx0ByiCYLr+KpXYErvgIEv7v+1p/2Dvco0MxUlxugzZwrZ1HnyPTGDc4wN5dsTmH1vYeF5w+RQ
	NmnScvrlPmzVfHbz0JjiIfyOz9v63Gz3605qoVNgCd2wUoFT5AGmj6Fjz/Ztona93ZY9RgQ6zHv
	STi2MH4bTjiB8ppa6wJjMsGHdLekMsP2goWg3Vb5AX7hA2LrmrvalaSukbxaE9YOCBb8vQG3DOj
	3jeKbYGN/js1gHiodr6HaXSCLKpyJfRT1HYEvRrCi8UYBWpGHE9Ap41hwIL4ln8ZPQ9pN1A9BoX
	Yuw32ycIhBbIzjzrNXgvhE0iKxU14b9iozjsuM6qs=
X-Received: by 2002:a17:90b:510f:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39debf6f2cfmr7127701a91.5.1789411375213;
        Mon, 14 Sep 2026 11:42:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39dfd74c365sm258394a91.0.2026.09.14.11.42.54
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:42:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c307941971so5246334b6e.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 11:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789411373; x=1790016173; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3geujkzCqEAatEWbaDVNzshK13FVbc1sKj1PBNVHXWU=;
        b=chizRkl5SzAlnJkhANIXT4vGsCsqQr1k9c2WskqsV1n4tm9El0+uMyaqdNt8DGP4F0
         JwGslM2BMHz/iWy75z6RDA3RO7IsZMn0a1pDl+ShdU5xCpNa0vP3wF2Asoi5SjZFD9up
         JHCYRsLuKuaJv2ZllGicTcgrkoH0qFlLJDiEQ=
X-Forwarded-Encrypted: i=1; AKwUvBw+rNNcrxe64v2x8aJX+yqoi9ptzYHpAXBYNT7HdmcKNztZ7hgeRwNDIp+Ap/iwTV4cI1mn8bjgJPY=@lists.linux.dev
X-Received: by 2002:a05:6820:f09:b0:6b7:46fc:1cd with SMTP id 006d021491bc7-6c542041664mr2261097eaf.44.1789411373628;
        Mon, 14 Sep 2026 11:42:53 -0700 (PDT)
X-Received: by 2002:a05:6820:f09:b0:6b7:46fc:1cd with SMTP id 006d021491bc7-6c542041664mr2261069eaf.44.1789411373137;
        Mon, 14 Sep 2026 11:42:53 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm29037930eec.24.2026.09.14.11.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:42:52 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Max Engel <dev@maxengel.com>
Cc: linux-wireless@vger.kernel.org,
	arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH] wifi: brcmfmac: schedule bus reset when the device is unresponsive after wake
Date: Mon, 14 Sep 2026 20:42:48 +0200
Message-ID: <20260914184249.1464637-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <178686152030.336421.12015467912819395181@maxengel.com>
References: <178686152030.336421.12015467912819395181@maxengel.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sun, 16 Aug 2026 06:25:20 +0000, Max Engel wrote:
> That worker's only SDIO trigger today is the firmware-halt mailbox
> interrupt (HMB_DATA_FWHALT) - which a chip that is off the bus can never
> deliver. Schedule the same worker from the KSO wake path when the
> failure is conclusive: wake direction, retries exhausted, and the CSR
> reading back all-ones.

[...]

> @@ -770,6 +770,28 @@
>  	if (try_cnt > MAX_KSO_ATTEMPTS)
>  		brcmf_err("max tries: rd_val=0x%x err=%d\n", rd_val, err);
>  
> +	/* A wake attempt that gives up (whether by exhausting the KSO
> +	 * retries or by bailing out on consecutive access errors) with the
> +	 * sleep CSR reading back all-ones means the device has dropped off
> +	 * the bus entirely, e.g. it lost state across a system suspend
> +	 * despite keep-power-in-suspend (observed on CYW43455/BCM4345C0 on
> +	 * rk3566). No in-band recovery is possible: the interface is gone
> +	 * and a module reload fails to re-probe (-ETIMEDOUT on every
> +	 * function). The bus reset worker already performs the only known
> +	 * remedy (mmc_hw_reset -> pwrseq WL_REG_ON power cycle), but its
> +	 * sole SDIO trigger is the firmware-halt mailbox interrupt, which
> +	 * a chip that is off the bus can never deliver. Schedule it from
> +	 * here instead.
> +	 */
> +	if (on && err && rd_val == 0xff) {
> +		struct brcmf_pub *drvr = bus->sdiodev->bus_if->drvr;
> +
> +		if (drvr && drvr->bus_reset.func) {
> +			brcmf_err("device unresponsive after wake, scheduling bus reset\n");
> +			schedule_work(&drvr->bus_reset);
> +		}
> +	}
> +
>  	if (on)
>  		sdio_retune_release(bus->sdiodev->func1);

The hardware recovery reasoning makes sense. However, reaching into
bus->sdiodev->bus_if->drvr directly from sdio.c to schedule drvr->bus_reset
breaks the driver layering.

The common entry point for scheduling bus_reset is brcmf_fw_crashed(), but the
device coredump done in there is guaranteed to fail because of the unresponsive
bus. So I suggest to add a bool parameter 'coredump' to brcmf_fw_crashed() to
indicate whether to perform a coredump so we can opt out passing false for it.

Regards,
Arend
