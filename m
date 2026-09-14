Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5BF38E106
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416224; cv=none; b=Vg3erQqu+DcO/Kq7qBnBrEe3BfRtQawKPXERjbmsYw5iVSo6+5aVRy0M6UjwMBeY+SFEukg9TXRPznQje0gfl0EuPgUCEygBIidx5VDLWy2JZCcbETaMaNypXaHuWcHVxgsGTdD+/IozWwghmacJ4d9nihD3FBKtGeWTBLxPhz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416224; c=relaxed/simple;
	bh=iGHNNVQOC0D0YNnZ4vMitSMlVZq1IOKF4aTaBo1p2b0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EoVTugzXQQZs9KOJomtZkDu1csM9zChxxnJ5INi3iRcrXxZY7xZdex7lAuTVN5GSXPYxcOeMGPVygteTS1ehD1uGm7w2Uns8Lmi/5/yp8Zx5Qd8T7/+LnJGer1iGg3+X9KnkDAB/HeSg0ia0WCavacZD4EX3kXWA+lYeWqujdKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=N73Dvw9Y; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="N73Dvw9Y"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2dd76b1361dso2244975ad.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:03:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416223; x=1790021023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P+2cvsudH7ftH8jFsjvcC49I+38SHnXJ8HERpOnIBgE=;
        b=SmmAt9I5SlDFcH2noqqAVoQUJDVajZo/Uffyrgyqccbl7hdR3JSAPozYej8+0sopdg
         9ysjiXfQ+Ic5degy26w+ipXecpipuqtJYgB8WsagQ8wY7a0K6YOS67hXW7TCzbk3YAc/
         9cSB0eLGEvZiwxUiHTXLaFG+UlOD/sZ+6+xumS1ByQbWoXjOE+SsBN0FwZznYxyErG7N
         V+Zlg2N0TdbRsmq9MjCMw8A2IojdTImhChqV8oOeb24s0z5AZ9rgLK50JLQS2Ur8EnE3
         R2y0Dauf7jvx+tlsFWWk3pjXKtV5XVXCSEU+owUVhM0YFlZh4pctHNWMNir7ukgRf8Rg
         Xl7w==
X-Forwarded-Encrypted: i=1; AKwUvByt/EBSBei4tsTh6cIlVuhVc8S/Btwt3M1OBclQZGDS96xNSWPkSIjUBRHuwyEFGmzed0DF1ffyDa8=@lists.linux.dev
X-Gm-Message-State: AFuF++m2cY1l4u4aOjijMUKRIeu3Ljye9ejSncYk/dlamYMjOVFKD2QX
	BPymGrGNJpcyp2ZVaeLpwFiiP0hvTMobtSipQGl/BfrLqT9/QM9Bfk3HtwELzvQTbByFD/5cyOu
	LAFhdIDsSJda83mymDhNSAlPVAskYzUoszSyPVrXSQgff3rgmrIRs7LYqGijQqVlqCm5kyDr0pe
	rV5fgWwowfAH6kOWOxLGuMTDhZu5QWU7h6PWDWt0AONPF/ViOPXwsdc2YlY2tH4ZLc7RbE/oty3
	eJ9NHNSyiTTA2CnnwopxA==
X-Gm-Gg: AYBFou2Choc6bqMYqz+q9goF0NIFmQaNGLQdmtEBc/BK0y3ZK9fJYrC6Bs8chnCGMNo
	dIHAuiTWGmqMqiOxrzHrQoGZxD53qaN7eSjUCFavaEplMI6q5ko+BST6o+sAy59dz1iOGAe+qXV
	+AnGuNUWJTzCdub1ItzxKc/8BQXq2pZBn9mV5l0tWRQB1+YS/oubD8BQNBe99WW9AgFZFkv0W/m
	bf3h52yD2+RTcLxryHCEqzkb/dtt8iS3iqYiTKzYrHdn4j+Va6p1U0kkZAo3NPqTsUbJ9BlPJ7j
	zD/TWIHiZvjAIUDz5ED0G49y0xlnB1WONQwSfEXtwuc0olG7Kr+p3GUooogtl2hx7GIG3wKGcmy
	B8VvaFuiEOhqunIGSgg14amIxTvVvhabd1Z4tqcqnFoP1roV0CGB/9APJgKDuhRU=
X-Received: by 2002:a17:903:1b63:b0:2bf:7b62:a038 with SMTP id d9443c01a7336-2dd6c60db2amr82035085ad.9.1789416222252;
        Mon, 14 Sep 2026 13:03:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2dd2cfcd747sm4661835ad.15.2026.09.14.13.03.41
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:03:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91049eac948so59376216d6.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416221; x=1790021021; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+2cvsudH7ftH8jFsjvcC49I+38SHnXJ8HERpOnIBgE=;
        b=N73Dvw9Y0kvsj26J+iAuNzp8Nn6/vGRm4z4GNjFtBIHQG/L4lryWWEIViZLvzyox0t
         Wt551oXixnTFSYohL/n5dgZzJU1Oj0UOR64Sz8DosKQ9a3NhLIi/arl5PyoA/b/ZJQme
         Svxo6bt2ujlsDSFakJ3nYxMnGYKfSARPltWGw=
X-Forwarded-Encrypted: i=1; AKwUvByVbqnDNIiijhWPb78xDFcgxOtSVsCI8cyfdouCX8CReVBEX4NEakFQD3WlBwicZCpQiNJTjeXAhus=@lists.linux.dev
X-Received: by 2002:ad4:4ea8:0:b0:910:4da6:8354 with SMTP id 6a1803df08f44-9122e55cf24mr59329356d6.17.1789416220682;
        Mon, 14 Sep 2026 13:03:40 -0700 (PDT)
X-Received: by 2002:ad4:4ea8:0:b0:910:4da6:8354 with SMTP id 6a1803df08f44-9122e55cf24mr59328966d6.17.1789416220205;
        Mon, 14 Sep 2026 13:03:40 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f477d42sm103209166d6.18.2026.09.14.13.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:03:39 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: bound NVRAM comment parsing
Date: Mon, 14 Sep 2026 22:03:36 +0200
Message-ID: <20260914200336.1742565-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260830135328.12321-1-pengpeng@iscas.ac.cn>
References: <20260830135328.12321-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sun, 30 Aug 2026 21:53:28 +0800, Pengpeng Hou wrote:
> The NVRAM parser tracks a length-bounded firmware blob but its comment
> handler uses unbounded strchr() calls. A comment without a newline or NUL
> inside the remaining blob can make the search read beyond the current
> input.
> 
> Store the bounded input length and use memchr() for comment terminators.

Please add:
Cc: stable@vger.kernel.org

> Fixes: 3e99b08ab53c ("brcmfmac: enhance nvram processing")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

[...]

> @@ -215,6 +220,7 @@ static int brcmf_init_nvram_parser(struct nvram_parser *nvp,
>  		size = BRCMF_FW_MAX_NVRAM_SIZE;
>  	else
>  		size = data_len;
> +	nvp->data_len = size;
>  	/* Add space for properties we may add */
>  	size += strlen(BRCMF_FW_DEFAULT_BOARDREV) + 1;
>  	size += BRCMF_FW_MACADDR_LEN + 1;

size is capped at BRCMF_FW_MAX_NVRAM_SIZE to allocate the output buffer,
as some NVRAM files can be larger than 64KB due to comments. Setting
nvp->data_len to size will prematurely truncate parsing of those files.
This should be:

	nvp->data_len = data_len;

Regards,
Arend
