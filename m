Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D993128D4
	for <brcm80211@lists.linux.dev>; Sun, 12 Jul 2026 22:35:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783895736; cv=none; b=LXxJCF9XDMN0E7qj+jpeqKt/xziGz9JOEZUAgOdljOuBkcuoxu7Sl5v/ZfU/OZiU6K8BZBiz7aUugl+ex52ANY0bc/wIKNvRPuuTcbMhonfV8ipuCCkCR6hGHuX0bC68PuFfXaCv6XeS8FonOgqt6AY9L/Fk7L33sHsB7V17sgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783895736; c=relaxed/simple;
	bh=Du+qb64uWThYzPhk54cXQ87/7uxBxrgbN8LKMjJzD/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=or3otHgJ+fo9Udk7eF8DGOu/fghLxKnzBGtr4mhwxpSzk2RD++Z5rfvKA40zMAvW2B1Lx5cS8vOsI0aW4VotRsHEqjWQn8XEopFi0fmJKKuhs51QDNMkWFlgYSwHrccAWS8THYExiuyLMIIn8LO0e0c5XGE1tgX2YDL5WGEjnDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=GhT1DV7d; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="GhT1DV7d"
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-2cc6dd436c6so30425375ad.2
        for <brcm80211@lists.linux.dev>; Sun, 12 Jul 2026 15:35:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895733; x=1784500533;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KubE9klKqieCjuCiH0MctfLK6hj7OQiSTq4hMK+gcPg=;
        b=cQSGXdfkdjlhgS7jRh0vtNXgrofxlDxBh2oe+/xvzyxvQzIDKYO/cXoAwe20V6Kjb+
         4RKNlx1XvgTo3tjdmocJ2P6GixT/mnhtj/RNJC8gKZBQt07C7hm4Z9CdNK3fRBSGO0bq
         aTUOscKUADNtKRvytDh3eyGUh9K4PTMnHK906s2lz6HzZ6B++aE8geOYkItRBgmp9Xoq
         9jKCItzTRFFanQAmpKoEKYRLWzwnVhricF+txiI3Oz0bHe8I8hAAI4WQkamuYMaOSTjE
         X6AFp2MGsS4uRTlGbJCd66rBNOHRa5FmTBQ0/Y9bBQ8T5/cEwxC5LocqVFY0pN2LGBOp
         hVpg==
X-Forwarded-Encrypted: i=1; AHgh+Rp6Wz/e/X4g3btd7W97D5GLCAUDN6wJzNOJlqyzj5/4qqOJqMgFv5e+csFg79Bb2zcjk2MX8HzAlbU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWLYAAgXvN4NiKV7U7EFKPP5n5LcPhu7zMG3yRnTIbUCuRFhFC
	38BMP8y6TD50cpH1pxLMvn/u6/EdWz06V9OnKN+Dwljjep55DygHs341OYfItp+vzEtBdBuMryL
	mL5/RkPauLosNtIX4U8RYWvUsAfW2t29CB49GVlpaG2soxQu/A3CVpfuvC7uMankEXgQouJTpMV
	5FeSg+Jrd5T2yxQNfNb5qmZpSKaFw2Pb1oAF0Xn/SA+bl4OoX3qkdotdi/bXCtSsDNmyyoXJHU+
	gcG/hiKIYNf38Sdap7dcg==
X-Gm-Gg: AfdE7cmlplbznDkzUtJoINzueY/mIJG26nizvOw7w75wWS2KCuBT/9PC4xfNLwa7nWP
	3Os9f9JlmFfuetwc2YuiROLOwrkEMZ4lNQYm4d87M6KkBfz5WMGj1aUDERQpygsnxR0dibLkV/w
	MymMxnCVMSLNbdFf+Nb/Qq8Ar8Gg91UohBpNQjJYrw44BeDwXKBZGLQHYWRti+V9Z/ttIAiQe4S
	x+Fue+pfiZDL5NWBzHp6ra43XB6gFGUS2flsPZgWpzoufhM5ByWh1qdhIfPTTvU1HZMKKFUgc8D
	PxhEeNq9/aWC/ez+hMXC0QYb4WAryhZvdDetCfDxH9Kj6vmp4AukN2uCyGMzEVBba/43PT+SE9k
	IEASu2OvF0mk+P1+kdt4u1feUfxK9N/+yZ9j7SVmWGDsJGggwv0H1EJwq6kbDDs2mYauVkqE/z5
	3f006j2vz9BTTAPrRDLioGY0sU0WlN4O7kJXK4g410OzJ+4tZXwQhp
X-Received: by 2002:a17:903:1b08:b0:2ca:17a8:cfce with SMTP id d9443c01a7336-2ce9f2852b2mr70984065ad.29.1783895733396;
        Sun, 12 Jul 2026 15:35:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2ccc9bde042sm18275695ad.15.2026.07.12.15.35.32
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 12 Jul 2026 15:35:33 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e66f9e2baso295386585a.0
        for <brcm80211@lists.linux.dev>; Sun, 12 Jul 2026 15:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1783895732; x=1784500532; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KubE9klKqieCjuCiH0MctfLK6hj7OQiSTq4hMK+gcPg=;
        b=GhT1DV7dcb6AQVWPt0mfTDoRngYpbhQhbhlaILZuCKPXOns/9te4jfe6OfbmsddA3k
         h6hj9Oe+ANCAPp1gPfdjYH5p6fXXK39JvaqRluoUHOlghctzM1cjEvFDQEjj2IawR1JI
         otRKiq4yU+F41754beynQ5iINq0dJkQkaGDM8=
X-Forwarded-Encrypted: i=1; AHgh+RpD27Vc8jgZq8Ix8aXFXP8Rv/Z5gsJFH3spVLR7RXkr4/w/HA7ag966aF+R/thFzNsGxEqEzapBm64=@lists.linux.dev
X-Received: by 2002:a05:620a:1a07:b0:92e:f09a:90da with SMTP id af79cd13be357-92ef2cbffe2mr718629285a.81.1783895732051;
        Sun, 12 Jul 2026 15:35:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1a07:b0:92e:f09a:90da with SMTP id af79cd13be357-92ef2cbffe2mr718627685a.81.1783895731600;
        Sun, 12 Jul 2026 15:35:31 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92eeff38acfsm761274485a.29.2026.07.12.15.35.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:35:30 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: "John W. Linville" <linville@tuxdriver.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Gokul Sivakumar <gokulkumar.sivakumar@infineon.com>,
	Hante Meuleman <meuleman@broadcom.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Peddolla Harshavardhan Reddy <peddolla.reddy@oss.qualcomm.com>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	Piotr Haber <phaber@broadcom.com>,
	brcm80211-dev-list.pdl@broadcom.com,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: guard P2P device vif in action frame search
Date: Mon, 13 Jul 2026 00:35:27 +0200
Message-ID: <20260712223527.2184308-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708063929.718152-1-lgs201920130244@gmail.com>
References: <20260708063929.718152-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed,  8 Jul 2026 14:39:29 +0800, Guangshuo Li wrote:
> brcmf_p2p_send_action_frame() checks the P2P device vif saved probe
> request IE when deciding whether to perform a peer channel search. The
> P2P device vif is not guaranteed to exist, for example in standalone AP
> mode where no P2P device interface has been created.
> ---
>  .../broadcom/brcm80211/brcmfmac/p2p.c | 1 +

This fix is already part of the pending DPP series by Jason Huang / Kurt
Lee (Infineon/Cypress), which I reviewed on 2026-07-06 and asked to be
split out as a separate patch with a Fixes: tag. I expect the DPP authors
will be addressing this in their next revision.

Could you clarify what your relation is to that series and whether you are
working with those authors?

I am not applying this patch.

Regards,
Arend
