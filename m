Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC8038E8A6
	for <brcm80211@lists.linux.dev>; Thu, 27 Aug 2026 03:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803133; cv=none; b=Jo3feBDL+TOXMPetVSWck3bPG1wrQ2ZBifKsBSK31cczjhBBzPB013EWJ/pd1U46TXESvfLQP6XfGu90CCu7N2tbyb08h0xW162eyrMW8RQwGbNqYgi0vwbBvKto+wQsYLtJX/NcQmR8ozyXp0NEAKRxcrC4PHEbP7gdvFc2i6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803133; c=relaxed/simple;
	bh=xVRZFbDUIViTRBkZ8muOyVesN8/ZBW2mU/Uvr8Y3YBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SJo1neqSFne5zCG/PFOtYSkQybz7T91iW8x6hFvn0NtVz8QncvwdK2fyzVJ5m+L52dohr2smrf53q280oAAn1azK6M6d1vTpTCjcqnjkTAHDLnt43iVhwunfqxfpEkgpMX2grGPPY6HfXZoPZvIc7TjSzrPWBQBxhVRz8yNWvsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1U4EwXn; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1U4EwXn"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-482db627cd8so621795f8f.1
        for <brcm80211@lists.linux.dev>; Wed, 26 Aug 2026 20:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803130; x=1788407930; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CAzoKxSQ3b+/c/GS7UxwHGejvR1ze+cQZf36sXyzK8o=;
        b=C1U4EwXnsemo/dowH3hUlshkqM+z1ixzcSSJBKEe1gnwRMCrUddi6zM4+yGwk8mztA
         CilNubnNe1VsmJ8rR+1bMVTIfol98pfs51ZQU5apj1x1se7JEaqOoN1Eh4XjOkWL5/zZ
         nvebnsSuYoeCChegNMf6lxAaplo0MG+vb16XzDyczRRl5X9eOJ5MJJWC6vnpFDRCIFci
         hRC+as3X0D5EVYYYt63RNK2GiAY3FkvnLfmhRYEpnNT7YmdRTRgICdZj46we/LnI/LW/
         JLwXswAaNM5uIurjYVgE7ygzypvxx9twFNELum98rG1pf1qsqCzKwwCElpHxo2ZPB3db
         P36A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803130; x=1788407930;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CAzoKxSQ3b+/c/GS7UxwHGejvR1ze+cQZf36sXyzK8o=;
        b=LDoxU9k2dy5SS0dP+VNMaQQbpgfZAaYLJZc9XKRmSUj1AeOyMopJfH8PBYj42hlbUD
         koYX6NTSpUBJsIzhB/L4gdJ2tQ44v+Yf+0p/BF2ZTAnCyYfn+q4X9eOPp5aDUgeyqRSL
         kRCphS1AKi9VdZS8rIpaG4RzSLaU+o5kAs3n7iNxcShc8lSUIJERkxUpnTZQVhctPhEr
         4jKCZHW/vZcGIcl66MQcgnKmcpW4nDAJ/9sCkfuS+MlcHPg0V4Hf04ecMsuGDeYjfZ2n
         GefNVLLbFWdHj0gQkXNH12rP08cr79qP71qe31m7EAtNzBGDmoxFPqx4zsnNMICiqwEn
         XJzQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLqVpTtKjtK3ncnnaI5ecJxFlGh7rqha+lR7VV09aGvjci9+duMkZT1FaiYtse5o8a/3k9KZrV9lI=@lists.linux.dev
X-Gm-Message-State: AFuF++nElJDSJ1EUQcke6kP58unXcmGXPKympEea9TzFoMLGbPHjAp4v
	lk0HPsESfRb8dNab+z3e93z9/bqVl+nD4iL76TuZZWlDZZWT4E20YDKh
X-Gm-Gg: AR+sD10L83+QbPtbVUFtNTPJ6RXlEzoIm1eat9VqrWJvdzyAGJd/L6RVL6XjmTwoR6o
	cafKd4bZAlpl0VMNdJf/G0W0J9nak6jAVrFSOlIrSevVyEakdI5cEqk9S6dxbfjto+v3pY0/g2F
	D61QnfUO7HQyD7LKWuRjHlZxe/YR71nJxjGUJMvCLB2Q++nFIklNTUx6mrnBequ9CBj4lhT5Sks
	02GjsiS7w64UpwtLeOUHSlxps15wY+c3Ck9qSnQgeTCzrFIU63XPib2t3KLfepJ5XICvgSszdjL
	m9Xec33kTiy2yUykdA9dyHrCvOJLphX6JLCCxF97x4o0zurWZ8dYPzfxF9V89zVWOw0OXZbl6ix
	fhdobkQzufNHaCq2CY4YmEI//tJw4FVqj88kisODFIEGD/WifgXEwJjy4SlDUPrV1wiMC/2nZQz
	4a5JS+6lEJmsX19qHlO39Mb0HxiyAfw67/dfEeuBzHXTiAaB832q9U1G7aTbqVYfpJn3Cnk9WyI
	7KYOCh20Nuu9dOpIlG/oe+f9GV3i45x0yAthjY+a6cH256/VRNJnVzHxuTDvoI5jGmBZIHKSUE8
	G2LWzJUk0hcPS9FfFDG6EZY=
X-Received: by 2002:a05:6000:238a:b0:482:e968:86f9 with SMTP id ffacd0b85a97d-482e968892bmr7778855f8f.14.1787803129596;
        Wed, 26 Aug 2026 20:58:49 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482e27ab569sm5601745f8f.16.2026.08.26.20.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 20:58:49 -0700 (PDT)
Date: Thu, 27 Aug 2026 05:58:18 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>, 
	linux-wireless@vger.kernel.org
Cc: Hante Meuleman <meuleman@broadcom.com>, 
	"John W. Linville" <linville@tuxdriver.com>, Franky Lin <frankyl@broadcom.com>, 
	Pieter-Paul Giesberts <pieterpg@broadcom.com>, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: fix lost 802.1x TX completion wakeup
Message-ID: <ao-1n5uWuVPKjhb1@gmail.com>
References: <20260811082702.44521-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811082702.44521-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 10:27:02AM +0100, Karl Mehltretter wrote:
> Fixes: 21fff75d2fb6 ("brcmfmac: use wait_event_timeout for 8021x pending count")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
> LKMM results with herdtools7 7.58:
> 

Just a friendly ping in case this got missed.

Thanks,
Karl
