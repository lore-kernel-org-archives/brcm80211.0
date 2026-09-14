Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649C639CD1B
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416270; cv=none; b=HTM26lc3UikKcI0KXLN9YMM5fMQsU5KIXDs4ETZQcSCZsWj+yum5YNnoQy4bexFFeZtG4s+T7ztxo2wNRVicPwd4gEVqXdUdmIP20C0RIgHze+MBS66yaN7rrNyIgerkhLGqTQ9biccAewmyjulYBpWhpacgpCKTu5IyLYAen1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416270; c=relaxed/simple;
	bh=9K65xndLLRrYwT7rCvaQd1+hBqv//v0SOM13WYuHQNU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LgRauv0t5emcbpJP2hFX2BY6uH+GR9ZAQRD8eRxNvnGMmbOsW2b6r0zpnofB4VisMSkA+rm9Dj5mFwqS72Ob906DXZje/kmOHRIeMfseZDKluLTyWTpUMsq5+57Wvjx9dWn/7UZZidC3d7RDMW74KwplLr7+Z0+MXIE5XZ0vZ3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PrRIMEnf; arc=none smtp.client-ip=209.85.215.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PrRIMEnf"
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-cbee846deecso4907957a12.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416269; x=1790021069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mf/bi/6NPrPAKOA8SzbYzyoM+XnS0eq5q/YeLsZr41k=;
        b=bngi7hF3Ehgs4kPyiFTpf913MSixcRenYyaeiMlGjyHbFFoLOAd495tRzfHKOLCT3X
         kvK0WD8o6r7V43vb/kaOrm5wj0iplFIp3Bk6UtbtOe/bQMHraOOB9H6mo3cC8Lg1GR8l
         VkB2O2vyFIVATkVvfQxXEu4yEG6CtawtsoypIduyGfnj6L2mNPZE7/fHhQyfc7HbNUrY
         Zx7xoQNEZZ39wf3rZmxTkvgdQ+CMG0A1cMAtJe0j/lyRFveZ2Ra9yF/B0Ih6RE+myTAU
         7M+8WA1quf2OQVEBOjFFtcgejdSP8w+EbBn5hi0RgIV6M+fJbnTvqLNxywLLYxDT1Xbx
         pKkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzYHNJ0bitEQ4lhRwuGZUCYjg2DQmfJzG6URfkZbkRPfsgtt9tZUxqUnHID+JIICKb51D5VVNdyA34=@lists.linux.dev
X-Gm-Message-State: AFuF++kXqdF1KT1lbHd289laIVElSDh1d5bis3jTxpIsJo4kbspveyk2
	OqQkivLlz5JxgpAbCN5kHudCt+dJ3YXINoDRkI0Wob+OZ4AIlmZ9PdUNP1ePHr9VNIJdl33hCDW
	dFdWQzSxNJeM9g4c8N7fyi229H98HtL8pp/b5BsZ9NaBnpu9T/GSrhpi5Pdo2p9K7dcXJIIHYzb
	02Tq8lunMrPwFkyq3OrNMfqTZzYpTGt173FoVoREjplQV/PhLbBRHpY6kz52IKSsi18oOGEprSK
	yMUinn929nqUfG14PXStA==
X-Gm-Gg: AYBFou2K9pPWEpAh27ywcxohvFysTlHzACWBl24cQYdqZveYLudDK2X24m8x7YcN0bb
	8JHtE7bvJSyJDTxnzj7jPdZ9cFY5xvqnq6cG5sSLPLsFxuZpIu6ZmWz86SPkZwfFew/Tz19VcvQ
	hqSr9epMmBiMnOF9hSYUbhZ5x0aOiRWrQNK7/cH00U4txy+glME+z+VTldSE2JnQt8EJlbkz6Kr
	RvmMAo9e9GgIEFUj++JAtdx4NjGcA8icSQxFeFEebWwB4xAKp/3n3WaeGdmnQZ/pzOKXiCPz//0
	Xk2EE/Bq1Kra9ZCIq7JuMW6MRKldH4UHIGiK83zYK/+qivuSSKhZdt0PfL0UAFuNJFabyeI+wdy
	SgWeJMxT8+LGQsfPRQZNwXgbLnBFJe3mdLWd+YB/KGAg6sReiA4f379e6olDpOqptSpz4iNk6CL
	akrxIkWPV4pUxkHgCgf5xd5TMs2LfBuiIIJl6HCeg=
X-Received: by 2002:a05:6a21:6e97:b0:3d3:ae50:97cb with SMTP id adf61e73a8af0-3db4070267dmr9251719637.24.1789416268767;
        Mon, 14 Sep 2026 13:04:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc4c65b1a04sm4374441a12.6.2026.09.14.13.04.28
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9107002647aso47057546d6.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416267; x=1790021067; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mf/bi/6NPrPAKOA8SzbYzyoM+XnS0eq5q/YeLsZr41k=;
        b=PrRIMEnfycNrcddBgfCqasrN/t1EVcOM7rtZT1MxI8WAk+s7luguVaBW+Mehh5jq5d
         rGa6m0DaLLbtnvi8aXfrd+hjdMdXYk6XkI5NzYsHymEC5FYh+9QaGVY0sPcCuOFFRSuL
         xTDRblZTcutDT9Tu1qeQiSvWgkhA+65C8RJ/M=
X-Forwarded-Encrypted: i=1; AKwUvBw4iUtKEozU6aoqMqOYuskQH908hkk5q/BqCpg+h2f44Nnj7HoVmUiUSFwL39SCJiNJgEjZnDsNL6I=@lists.linux.dev
X-Received: by 2002:a05:6214:4709:b0:912:34c4:92ec with SMTP id 6a1803df08f44-91234c495e6mr9909916d6.26.1789416267549;
        Mon, 14 Sep 2026 13:04:27 -0700 (PDT)
X-Received: by 2002:a05:6214:4709:b0:912:34c4:92ec with SMTP id 6a1803df08f44-91234c495e6mr9906166d6.26.1789416264798;
        Mon, 14 Sep 2026 13:04:24 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a6ebsm103068516d6.22.2026.09.14.13.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:04:24 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	wlan-kernel-dev-list@infineon.com,
	Carella Chen <carella.chen@infineon.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v6 5/5] wifi: brcmfmac: advertise firmware fast roam offload support
Date: Mon, 14 Sep 2026 22:04:15 +0200
Message-ID: <20260914200417.1744264-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911065656.1269623-6-Jason.Huang2@infineon.com>
References: <20260911065656.1269623-6-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 11 Sep 2026 14:56:56 +0800, Jason Huang wrote:
> From: Carella Chen <carella.chen@infineon.com>
> 
> Advertise NL80211_EXT_FEATURE_FAST_ROAM_OFFLOAD only when firmware
> reports FBT or OKC support. That lets userspace provide PMK material for
> firmware fast roaming without enabling the path on devices that cannot
> complete the offloaded roam.
> 
> Assisted-by: GitHub-Copilot-CLI:gpt-5.5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Carella Chen <carella.chen@infineon.com>
> Signed-off-by: Jason Huang <jason.huang2@infineon.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 4 ++++
>  1 file changed, 4 insertions(+)
