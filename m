Received: from mail-qt1-f226.google.com (mail-qt1-f226.google.com [209.85.160.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C92243AAF60
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 18:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411404; cv=none; b=r1Mm/ryW0Y4miR967EQf1bZUwuxqzmpNQ0/2nUoEGDbJCULmLgD7F0tMk+RI9SitrRHN4lUpOY7F+l+aBkrF9iSKDeZpQvaewF9UUzsd1S3mHrGW6WcmqYB2DMSt3Y+hVGqAJHn2Rcb1Te/2i5/XJdN5mw/u1dBnivjuKDJ8Hlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411404; c=relaxed/simple;
	bh=mtWjlL6opbGn5Z01q2KziQo4eyqJ4qENxxukKPKDwso=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxQW6NTROJXaWtzhJpH3ACKJkSQrgbpHWR2Hl+APPUssgnqs+X4hJUkOAWO9q7YXBDj+sY+PIQJsVMR/dMm6vK7EbDaqQF5GYdM3wffAVMkrjI3n/XoW1hIrMZBUBqyuEselGov9H0xOpTCjRYS0Dyb6sdIpoRwcilGOAIVaoQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bSVOvpBB; arc=none smtp.client-ip=209.85.160.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bSVOvpBB"
Received: by mail-qt1-f226.google.com with SMTP id d75a77b69052e-52ff7e275e0so7529161cf.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 11:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411398; x=1790016198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TRYv25iRu9fFTWg27vlxcds24V+T7PCoVZa9yNuXC2A=;
        b=XbF2lWz2mX46Hot6x3uD0j+/z99tCxFJt4I909lxdrQOXk5S3ZpO7phrCGaUTHnLPf
         RkWLutZnZ+MpUH1ornzBxaDxIhfTMuOoOX80EEEO0PTtRYxE/ofoJBC4gzqo5sGTzsPM
         O0kDKhxZ04oe4SZupSfR/5uZE1cz0ofzXmqu+dr9XfCk+EMQbGFS2HOytE8FnR1C/K3N
         p3THm94PdQcInPKqqLObi+3qkoR+5cinQWhelgi+ySCileDf9N3cFgJ8Nf4qhZNMJ7+o
         Ev2hEvtsonv/IQkLNdk5IQnUkSJDZXmhGuuwP3Ah2oFS+W2zK6aHiawZvkoQtFD3k1n+
         Z7bA==
X-Forwarded-Encrypted: i=1; AKwUvBxxEchanQbEU60T6C5m60w3eOpC00Vmg/kh427/aahHUsv7Zi6zwGPtJcqDMrWvBRaBXsH2kgUzXyw=@lists.linux.dev
X-Gm-Message-State: AFuF++lrA/POXRluhUSRSfzq5dDfZlJj1ld5nhkpxwCGxQw/o10XnNg3
	jW9Tf5bNFnx9eR2uC+dYUSUsflNzXWXbV8Jh8qLaUEmZdAghqBgTJ7vtTdfJosT2y2Jv6CxzfEP
	vGhzLsCGPesnVxGGL8Tc5o4A6PoZ0Mobw7D6R5tnSz1RmrzTMqY4mxeQAHF6nhdpWiZU1JyE2vI
	pqjsb3OgbtPPVzoMrZR3k3+15lydad+NDC+FQesxDvzNvgkYqBB4+BovL9U9YJ3NrAb6z5WBeoj
	FYdZcifQilfsCpGYAOsBpOE
X-Gm-Gg: AYBFou2D6CAYoRL88lInjj1eZtLKlVUaDQpq4fKdlS+6v2n9V4xB7FxEC6X0zHywfYZ
	rQYYplwFAS6EC7U8d+UZNkfvbmhboGf3MdDPjfu2y2TKOBKVdc7Bq98HOkN7SEqpw71FLlvPcwq
	Km7ASZ/WkFKBSEAqltUFxNLVEKtQap+9/A5i9ee6WpcF3fJb/ps/uLJS+m/cAB4bebTlaZ1wHJ6
	/lmGXeXnzf7U1ZjxbR+BJyoOgVMxAIOREZhXPgs4fQlng/gX0rhGAWeo9STXJOxU7Iwtdgp+BIJ
	ns81qVUmvtntrgE2eWjn0jkpzUmo3F9Bpg1bsQ56E3Mwv39ZU4Swq4WsK3dVWBCWkHsO9V5r8zm
	Ae6QbggdNpGQmsMiBOQUdkGfmKX9JXPHI7abn2/k01aBRFT//ivrO5mTj0XgKoWoAFEsud86563
	RVQp8homQ8garmgptW0bExwPWbo2gWWcUI4PhAq5A=
X-Received: by 2002:a05:622a:1e0b:b0:530:f962:f6f2 with SMTP id d75a77b69052e-5310d05cf6emr62667261cf.45.1789411398442;
        Mon, 14 Sep 2026 11:43:18 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-530e35681d2sm1188051cf.1.2026.09.14.11.43.18
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:43:18 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4922b7c31so3605988a12.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 11:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789411397; x=1790016197; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TRYv25iRu9fFTWg27vlxcds24V+T7PCoVZa9yNuXC2A=;
        b=bSVOvpBBLy7W9wyR2Lyl4+ei9J+DUjHe4Zy5h1/AtyA91eKMotAMEq7gJFuHl2inhS
         hbe8uYVi4ZNg0uQeZG0U05/I9fVcXIn/0MIzsv3kBzcZdqDI9tyxnCkiJClJJJ9FmjrN
         TPf477wykmV+buhOQ6EqMwVgYlvNVQ8Vy/qMI=
X-Forwarded-Encrypted: i=1; AKwUvBzzpUjrp13ojRvAibTYO51x8AjOsDdWyQE5rzwBLRDnUZmPEeJUBCImy2wb53eFddZs9uqD4IgUjs0=@lists.linux.dev
X-Received: by 2002:a05:6a20:a11d:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3db40672d49mr8756119637.24.1789411396996;
        Mon, 14 Sep 2026 11:43:16 -0700 (PDT)
X-Received: by 2002:a05:6a20:a11d:b0:3d3:adbf:7783 with SMTP id adf61e73a8af0-3db40672d49mr8756051637.24.1789411396577;
        Mon, 14 Sep 2026 11:43:16 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b347e6sm24621139c88.4.2026.09.14.11.43.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:43:16 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jiangshan Yi <yijiangshan@kylinos.cn>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	kees@kernel.org,
	linville@tuxdriver.com,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	13667453960@163.com,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmsmac: fix UAF in brcms_free_timer()
Date: Mon, 14 Sep 2026 20:43:11 +0200
Message-ID: <20260914184311.1477250-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260815121043.938414-1-yijiangshan@kylinos.cn>
References: <20260815121043.938414-1-yijiangshan@kylinos.cn>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sat, 15 Aug 2026 20:10:43 +0800, Jiangshan Yi wrote:
> brcms_free_timer() calls brcms_del_timer() which uses the non-synchronous
> cancel_delayed_work() to cancel the timer's underlying delayed work.  If
> the work callback (_brcms_timer) is already running, cancel_delayed_work()
> returns false without waiting, and brcms_free_timer() proceeds to kfree(t)
> while the callback still accesses t through container_of().
>
> Add an explicit cancel_delayed_work_sync() after brcms_del_timer() to
> guarantee that any in-flight callback has completed before the timer
> structure is freed.
>
> Fixes: 5b435de0d786 ("net: wireless: add brcm80211 drivers")
> Cc: stable@vger.kernel.org


Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
> ---
>  .../net/wireless/broadcom/brcm80211/brcmsmac/mac80211_if.c    | 4 ++++
>  1 file changed, 4 insertions(+)
