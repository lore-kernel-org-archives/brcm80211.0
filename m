Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C195388868
	for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 19:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576951; cv=none; b=Ogy0a0u+SFPLyVjfx2+OTWxCUlhC+VZhiMDOIOfl5dfbMDnyUwb4zjnhqakO/Sf2sAVhs+TmOlVbRhJkjjjfFSw+v8Q6dRlK43fiaub0rbwIHMirGBqDiAm77RXjO800pfclFsSfUfX/xJjmTW7k7V56c8s1fMtf4Pc44Fea/cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576951; c=relaxed/simple;
	bh=UgS0ACQKghCRnTSqEpsCpdjau8U0WER+rFa94nA8F50=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WDLl1eJZ0vBT7l9p+5FujhbZtwFAsFaiZ4N5+n7Mys1ezyir7FB1GIPitJlipHqUGMrjOQViRpOS8+DwlJNgwFdNPvfMbAnRqfFXFOo5WvEa49iA9hcrhj3xB4XT+OFLa3hPyyWbHmotSfdNPDccrHOKW2gWG0n5plmTw75ifZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IB1MvQtL; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IB1MvQtL"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2cc891373e0so131070955ad.2
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576950; x=1785181750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myc/a7EGXCgUkCQNczBsGQYFLn7a2lftGxxjNjjCIDA=;
        b=Negs17Ye209m/17hrVq3uoZucr8ENxtnTEiHUJkgjCrsHXBOtG0scXuKnsUchECKsm
         uNovNL1bTNABCCgltaMM31MotDymny9So0f+PDamW0CBXDvpxC5qIHHCIFkRYKl+fcI/
         O8D8lpa/plCNxFtfD4CuusLU26HTWRzPTU9bTw9clFH/hP43nW2ut8Af9ruFM/hVwCd1
         ce7wm3QgmbKX81WonamKFC61rW0QXDPNcDL8mDU2kJ8olaiuzgxB8JBYQfWOdFLSIlYW
         p9+XRy+5A0mGQ03EPhP5n7GoebFyvDRxC+N2Q/O2lNnZZ39MsbR3jxI4tz7Eepec7Bzl
         lrZQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBbvvL0qgNtDA3RHWda7jtCGzx78GHFCPZrSOqU1Wh3dXrIIs3H3OmoG1ukSY861K6CM24pYBDx+0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPmnwiRULtZqY772nd+r0/wL6u/pc6VjXUsz0uTY16ljg3ybqt
	3Kh9paymlmeiolF9W4YW8lDlLo4ooFiRMI84KFvdv93ZvT/On0zVb+0lwG+Jhka6mGauTVHOenr
	UM7plkqj8CPQyBgi8Oo0iik8ignfmJ/90FsXQay1s1u5tcF0XH3Ro5r48tjXk37TLKMASqSNclp
	Uu5bTfpE9O6UzMmiAaKNoLNXKrD3/48MRs4gttaA+s4cl7jrzsDzddm146DajAna0ww/+ZTZUK2
	ILEGVNNa8sJVtHvcHk1WA==
X-Gm-Gg: AfdE7cm8DlS4OILNvL6pmnQWq4J8KEOvbhsVqrRFHufGT1R2kKz3FLfAHCwn62m1/IQ
	ftZihmAXzbAe0mVTTQ91gc3NIiyDkhTBN5QLBTC3VwNJRCBzKpjytCiPuYMx2f1BMwtn1IOZLmP
	XTmMfqKeLvmgpHBj1QILlJLdf+RzDLJaEmdLBWattrNaKJQyZzMObVskzqhIlrpCWANTJQfcx3g
	00GXiJarR4ieYDaEbzklqobRICx5ZrsCN/jdsEyIervkkjgmPybAOOAtos8Z/y4oM7zNaYjjZCj
	2PmyUjLrHp0zI2TG/cg0eWLso9c68VQrnSLKnFOqohc9aDieRU8vtJKLK45oiP4xuzfZ6HJBeuj
	M8GRHldFST48uKYVRNExjal78QbWA/VfotDubUXtr+X0SrvHgZ3MSsGytuxu/SUliHXVk7vIZLZ
	3+smJdNezemMvk0iFgK2vWxX1DUY/dLY4egTo6kKiJjg==
X-Received: by 2002:a05:6a20:9785:b0:3c3:af85:85e7 with SMTP id adf61e73a8af0-3c3af85b991mr12063376637.34.1784576949594;
        Mon, 20 Jul 2026 12:49:09 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3142a051e8csm619292eec.12.2026.07.20.12.49.09
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Jul 2026 12:49:09 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c169ad16b00so503666366b.2
        for <brcm80211@lists.linux.dev>; Mon, 20 Jul 2026 12:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1784576947; x=1785181747; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=myc/a7EGXCgUkCQNczBsGQYFLn7a2lftGxxjNjjCIDA=;
        b=IB1MvQtL230z6oJRsGPowPHwluiFdTO5cWfpWfiH9fdK4FzECe4FrzxNXuTzvm7Pj3
         RsW/Wd/1Z0Z/7AP4H92/ZWFylNKVUS9Nlc5K1/AHWU56qrzDjOjBcrs/+ruzQA4zHE86
         k1DAJ/gBlg2Ix2si7SfUOTNZ1ks+Tt8K9/0Dk=
X-Forwarded-Encrypted: i=1; AHgh+Roc+1DJGLXagDlb7n6GR5cEjtLwACM/DruvVvKMYdS9pX/mc8dG8t+H95O3KaOYVVin/EySxY1Z9Hw=@lists.linux.dev
X-Received: by 2002:a17:907:783:b0:c1b:1315:163e with SMTP id a640c23a62f3a-c1b13151cb9mr21283466b.29.1784576947319;
        Mon, 20 Jul 2026 12:49:07 -0700 (PDT)
X-Received: by 2002:a17:907:783:b0:c1b:1315:163e with SMTP id a640c23a62f3a-c1b13151cb9mr21281366b.29.1784576946853;
        Mon, 20 Jul 2026 12:49:06 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705912972sm506543066b.14.2026.07.20.12.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:49:05 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Fan Wu <fanwu01@zju.edu.cn>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	kvalo@kernel.org,
	eddiephillips@google.com,
	franky.lin@broadcom.com,
	hante.meuleman@broadcom.com,
	wright.feng@infineon.com,
	SHA-cyfmac-dev-list@infineon.com
Subject: Re: [PATCH v2 2/2] wifi: brcmfmac: drain bus_reset work on device removal
Date: Mon, 20 Jul 2026 21:48:59 +0200
Message-ID: <20260720194900.2356442-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260718024353.3147201-3-fanwu01@zju.edu.cn>
References: <20260718024353.3147201-1-fanwu01@zju.edu.cn> <20260718024353.3147201-3-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sat, 18 Jul 2026, Fan Wu wrote:

> [PATCH v2 2/2] wifi: brcmfmac: drain bus_reset work on device removal
>
> brcmf_fw_crashed() and the debugfs "reset" entry both schedule
> drvr->bus_reset, whose callback recovers drvr through container_of()
> and dereferences it.  The removal path frees drvr (brcmf_free ->
> wiphy_free) without draining the work ...
>
>  7 files changed, 77 insertions(+), 4 deletions(-)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
