Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E038B125
	for <brcm80211@lists.linux.dev>; Tue,  4 Aug 2026 05:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785821315; cv=none; b=pNYBM8zVHbPKuV8uNdogQK5RJqkd1NMTe8eTJjj8sqApKMcUbBx0rnv4FqITp+WygZdbrO3903KtZ8YJRyySpPiNX6aBxEooxX7Ey/jQJGO7MgY0DZzbtdMLfIif8vdi3IphjEI3FWaPug1xW6po6Q5/IEHlyM85o4wZik0Zq4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785821315; c=relaxed/simple;
	bh=xLmovQy6eqBUDiJqbaKqkjv8/lbGY1eloaLsznaMOxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kM2vdl7NMwbT5UvOdERgyTJ1ebZw3O/PnU9YcRQCJNLsXQYEtH2yUqqjQkMUrbp87o/N0yKHVKZwolgMAX2AWo0znOvfSNDDTKp5MAd6F4ha6ZOpZk+DkC/kW0DH5GD3i2TqUVvBs/VUuN0l2fFWU2pEvY3fRh7EDAFItni1brE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in; spf=pass smtp.mailfrom=cse.iitm.ac.in; dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b=mVe3f9tM; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cse.iitm.ac.in
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cse-iitm-ac-in.20251104.gappssmtp.com header.i=@cse-iitm-ac-in.20251104.gappssmtp.com header.b="mVe3f9tM"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38e58034d05so4092656a91.2
        for <brcm80211@lists.linux.dev>; Mon, 03 Aug 2026 22:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cse-iitm-ac-in.20251104.gappssmtp.com; s=20251104; t=1785821312; x=1786426112; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tsAKhlaIH0uKdSxeDJ3Kz8LaG6giInRmw0bCqkHDsjY=;
        b=mVe3f9tMfk2KX1zzUwywvJkpXh6NMmOtcMwWh13HsE/T+F+ITXZeyWkVzCsomnYIpA
         q4mZyqvc4JS5ySwav8nvB1FJL1U20nZxR0iHXu73inRfKc4K2fPQjEyBx74AWPqC5Wiz
         KDtKMH5TOWkEMczjP+jkqmKi6j2m5nv0Zl8IbB9dbCUEl0SIDfOVJynZ3JVSEK7MBqD6
         yjua38mR4T0L+kCpsgVgHa6u/oXcDJ9BZivW0fqTPMTJK/SUnlWlehQiKKEeSQlEYWOa
         JdFbfUqXbsfNWdTf/OZXnV5Yq+ipzs6M+lZ1fp/FdlxNMRu40B56DizuqKYdmD4ZNWGs
         JSyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785821312; x=1786426112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tsAKhlaIH0uKdSxeDJ3Kz8LaG6giInRmw0bCqkHDsjY=;
        b=KfANfPdzmuA/cg2JspENrH/MoamfllkArGnrIjIWwiyBq/1R572KRjeDPLj3+Loez7
         nTz2d9xmTwM5oHBhX8LRKZqeQq5x7ROZ79UkKs8p1Vrd8oGobd4eJbIRA7JWUy9UJ8G8
         xE7MUC8mDbKih6ybaNHEJheb+FMB0JJYH1LgqijkTZHufDCKSnvvnf0mZxetfoq/fc6J
         iWf4FvChKpC1IPVm+PIUHlL6yf4l3O72mqcNSISpPDLtOmvjPi0M7Ii2fz9hd5s15XIY
         Snm6isyUgyP789AUJe0lAOEwxQ30704fG02734HAsEigq4dhYVMFBErlBu54KLB6Kfp6
         1G1g==
X-Forwarded-Encrypted: i=1; AHgh+RpbIZoBWiCRvDaAQcNU+79l22iZsHf2gAeb28eSrLLGnRN2rkeDzO7XCJslsNrmcxTB3dWJaKlbSqs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyETcsyqJBiJ0QTvfaVzMfHPxXzKrjuyfeYJ7ymXe3300R3v7A3
	31qPzXhg4Z0e/TRzYWjn2zda3Jv6kO0vQdkxI6mf2eXCBJhI6hCxkhXlvDlf4nTlsMM=
X-Gm-Gg: AR+sD11RTXjB4BJp/6rN3Vcz82OCwMSJh9HGCLywFvlFpr6G+wdMc8c7aOiXY0n07ML
	/PXcjop9XbLYMA5LLdJjFtzm315rKv7EiyEIBS8pKaZ++pmTCSGy9JiRyJkMPt12YMpnxK9sqtB
	Ohkr6k4UHOdw0b5G/n7hBvQhLfhKPNOtZrZyNaf3IYY5HsSEMzTxy3d/zZroWdW6qVcjwwIszeu
	aY8fY4RqJ+PAam0CfjsxEtHIBUJZIIxluJqMmZbMhLsaXQAw2Ze5xoC2gLX73NZCRRg3TOhMQk4
	lL2jbgCV3ldq+Z8uwaBD/Bu6ALIerF4wc1ghzrYnyjTZMybLZFN2NR7o4HudVaARoRPdc18SpX5
	vCbagAk93xxPAPGzLJsJTAQ+2/pcZlstTwuLlGcrseXZtL/T4aFVlEMvSAlLiccYtzUZlDhMAKB
	6OJGwoZw3n/UMoCHiykn9C10WOkZ3AyDAw/4jy5aIMJtbELo6VSr/Kld8GqgfWqv7/1T1YqlIo9
	8IjTEe5XuK1lLzqnVbsL7YdSLcY+SK5bGQ5Eg6LMojMevJVdY9qcLFyXRADd+QZ7XffuLvhzkE3
X-Received: by 2002:a17:90a:d004:b0:381:cef1:11bb with SMTP id 98e67ed59e1d1-38fbc4d6369mr12153174a91.22.1785821311856;
        Mon, 03 Aug 2026 22:28:31 -0700 (PDT)
Received: from Metius ([103.158.43.43])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315834e1eaesm1534690eec.19.2026.08.03.22.28.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 22:28:31 -0700 (PDT)
Date: Tue, 4 Aug 2026 10:58:26 +0530
From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH wireless-next] wifi: brcmfmac: Fix memory leak in
 brcmf_sdio_read_control()
Message-ID: <b67xzhxq3c5s5v7tnwdjtmbfmye7mgvdbowhyr7g7h3xdkdrze@b3w5waih4oku>
References: <20260803093506.1647790-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260803093506.1647790-1-arend.vanspriel@broadcom.com>

On Mon, Aug 03, 2026 at 11:35:06AM +0200, Arend van Spriel wrote:
> From: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> 
> The memory allocated for buf is not freed in some of the error paths in
> brcmf_sdio_read_control(). Fix that by adding vfree() calls.
> 
> Cc: stable@vger.kernel.org
> Fixes: dd43a01c5cdb ("brcmfmac: use dynamically allocated control frame buffer")
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> [arend: rework as suggested by Johannes]
> Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Thank you for sending the reworked patch.

Regards,
Nihaal
