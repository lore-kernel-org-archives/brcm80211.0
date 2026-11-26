Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.98
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703379;
	b=IHfhVW3h2BVwzN5nVVPtVQTfWaZipIEMYJOyAKMBU1iA4dCOOVrYfFx99Ni6+wuHxjbQ
	 4JWfyhRr15qmwxbypAnBhvZ4vSSYLBsxJLrrcbRt5TRfRi9ey11WQ77I+Ogq77I9xIL06
	 zfjEWK8WG0m/Rrrq1w1OyoGxdRO/cK16Ailx3hJMBQ7TIyqrb+H08KT3a69wRids+7H87
	 uFk2RxOd3U5gR7HCgemZ4pGOMl2qi7JzBnmFlkhnthFHz7mP/3KKPm7KLwd6X/xD6KeV8
	 70COGDNeildMN7tE3R1TOAJc6hvwcc2LhuP2BRtHOqTDSu1/bBuWKOnn6vpr63GUuNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703379;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=r1l7YftyqXs7iM3T2fswXI+W5xvpdRpS30r8876aD/s=;
	b=4Up3Cr3AnoZolp1uBZjcQyL7W/BC1CfYb+VRjIz/rUv3Oj4lKICvqXNd1w7SDKjPUwsM
	 VCbcjS+p8VbIHCkQjj4JVTd1r5rIMy97YeDxder4Tkm+MHmWu6mytu1APTujdsjt5/iLO
	 rwnXtQOWzqZzD7FAqwlab7YPHCPen9B2Kzo6mzCeBkUt/ITe2ig5vWBn2uk9v/TzdbK4K
	 BV5+M9uCpyFK29Q+3lhZ93/hnOvE3g6i7KnNlS3qstNEDPMrCxm16KMX1Wxo3Ay9/e72j
	 454fsVF8ZnzKO5OrbHz5bCWX1CLTjrCz4DQMb8gTJIIO7PDiT7MlXdb6pC75+YdAaHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aX3QQaX6;
	arc=none smtp.remote-ip=74.125.224.98
Received: from mail-yx1-f98.google.com (mail-yx1-f98.google.com [74.125.224.98])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF6B606A326
	for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 14:29:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF6B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=aX3QQaX6
Received: by mail-yx1-f98.google.com with SMTP id 956f58d0204a3-67bee1f693bso5607092d50.1
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703378; x=1796308178;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1l7YftyqXs7iM3T2fswXI+W5xvpdRpS30r8876aD/s=;
        b=Fxv8Inmer0Kmo5OsEdk1i3NJa34KzsmSYg7Z4OFqq7kVb3X8FA11CxgBGlKCSogd6k
         UGdmdu6vpgusMo71MHm9DOblD/xU1Ggy3RYf4brHYYbcupcV8hIFhe+4J5dR0hb7aFgM
         ic9Aw5qFxuX3R7/kFtI2lJSmW1pO2ySEOJNcVdBUmrIa4sA7DmXRtwT9Oh/nnqVw853I
         Bm6LDG1zd3fffyJRAc3AIvScmy1DQIE1DbMPC3BJXCWSxUNjT0cofTI7kvBVJTkYYTjk
         H0qmjeT3SY1qzNr9xSc+IleTdxTIdVTIM/pCSbKdQQsh4li/1E2+43bXkYTPoWcxwTDO
         K2kA==
X-Forwarded-Encrypted: i=1; AL+hErEAzvQ6eQPYuLiEQIujvGu+DTuLsKjaMy0zxxblbV+I6SVPScDRP7aPkNL11kuuvaYqEYOq/MBsjCE=@lists.linux.dev
X-Gm-Message-State: APuU4Z9pFqo1sDWNCiR79S9cbVQtNHg2GXN5N7/nNA6rhd8dwB4l7ej6
	3G/qV9bbgZ7FyzZdzQfLGgmQUR/fU2ULVHEJm+zB9xFdtolxeMv0OgGkywpuP/eQ84lRkSB9C2z
	gOxlRLmQ7dyRDRNs0ScJaP9edUwJhYdHb61fEqvVqB73gvdSNkLH3kOfsTnuKcyVPA6lv3zpSMV
	2H1ePt4D7aTibdya/5MTtMR7F6znvjOSzexpd6Bh1iKKHZd/nBkq7Q6K8zLyvMZaaXhw3IHJxoY
	GysptPNHoZn0QgvB/9/Og==
X-Gm-Gg: AZFdTZesem1PwRPfh1UlrMX4pLnPuotSToxk240M6MCwkddx5BzU5eDFbJ3HYwYpUXT
	q/egkHVfWax/mnh62lNUi4LrZV7giGsUNUMmCaPcUxcAv7Aydhh4aGmfK9LcuUUZruw9JFo5hdi
	jP8lOm0tT2R3+xTp22bScJqtbCaDerFCyDaPjBCDvXysPN2NR/hSKL4O504C+fo/2lMeW0LONl7
	4wropDnM48ZCFzalOwl/702qt3rur+3+rm5piVUzlsj3a1EqF8F0aqh5ShVjoFTAkhpFSgrSec1
	tDArIIMzrAXAOxdK0oBgYhiNwfTpwz+GHzopHkEV6y6Qf4YNnQIGoESiIBhlWLCOIW9KNqZYtji
	AbheLWRASEVPfeKHaW43YLaTEPX5Jph7WjlqER5Rb5lRZDJ4aiG/V0VdBmbzMgkdvlDdxy0Jr3y
	BWNwFC5KGMXXLHfuOSXXI5cTe8ZllFJc/sJcef9LE=
X-Received: by 2002:a05:690e:4851:b0:67d:b66f:dc9a with SMTP id 956f58d0204a3-67df44633a0mr6003882d50.70.1795703378087;
        Thu, 26 Nov 2026 06:29:38 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-67df31fa3adsm157224d50.4.2026.11.26.06.29.37
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:29:38 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-55d3e7ba879so134199471cf.2
        for <brcm80211@lists.linux.dev>; Thu, 26 Nov 2026 06:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795703377; x=1796308177; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1l7YftyqXs7iM3T2fswXI+W5xvpdRpS30r8876aD/s=;
        b=aX3QQaX6T7UdFZG3AlXRfHJMd7o3XYZ3OpiCdbVgUgB0pZUgkxOINj/JmMQbYi244w
         AUSGbuHvZANe7TxYTivtB7uEa0kjV9GIdlcXnF0m78LLIHlgseFOeKxFYwHsoddZdzAJ
         VK4ERNzRbWsDNy3kM1wxMDu7326+E1u23waLo=
X-Forwarded-Encrypted: i=1; AL+hErFldMjobOLaKdnhxiF+ja6zBsJU3qQPPpoxBgBp5r859QtklCdbDpLhm6vKtar9wTgfDtQ25OyoskE=@lists.linux.dev
X-Received: by 2002:a05:622a:4a8a:b0:537:dea7:adb1 with SMTP id d75a77b69052e-55d768a3a8emr386242071cf.4.1795703377261;
        Thu, 26 Nov 2026 06:29:37 -0800 (PST)
X-Received: by 2002:a05:622a:4a8a:b0:537:dea7:adb1 with SMTP id d75a77b69052e-55d768a3a8emr386241611cf.4.1795703376681;
        Thu, 26 Nov 2026 06:29:36 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921347a0b6bsm187895256d6.1.2026.11.26.06.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 06:29:36 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Soeren Coremans <sorencoremans@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	arend.vanspriel@broadcom.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH wireless-next 0/3] wifi: brcmfmac: pcie: recover from fatal PCIe errors
Date: Thu, 26 Nov 2026 15:29:30 +0100
Message-ID: <20261126142933.875175-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261105215954.184290-1-sorencoremans@gmail.com>
References: <20261105215954.184290-1-sorencoremans@gmail.com>
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

On Thu,  5 Nov 2026 22:59:51 +0100, Soeren Coremans <sorencoremans@gmail.com> wrote:
> Open points
> -----------

[...]

> 3. brcmf_pcie_reset() and brcmf_pcie_remove() free the DMA rings before
>    brcmf_pcie_reset_device() stops the chip. In one of those unloads, the
>    device wrote into freed buffers first (8 AMD-Vi IO_PAGE_FAULTs). The
>    other real errors showed no such faults, so this looks separate. This
>    series does not touch the order; you may know whether it is deliberate.

I see no reason for that order. Freeing the DMA memory while the chip may
still be running looks wrong. A separate patch that stops the chip before the
buffers are released, in both brcmf_pcie_reset() and brcmf_pcie_remove(), would
be welcome.

Regards,
Arend
